package com.mycompany.metamong.webSocket;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.config.ChannelRegistration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.ChannelInterceptor;
import org.springframework.messaging.support.MessageHeaderAccessor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.server.support.DefaultHandshakeHandler;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

    @Override
    public void configureMessageBroker(MessageBrokerRegistry config) {
        config.enableSimpleBroker("/topic", "/queue");
        config.setApplicationDestinationPrefixes("/app");
        config.setUserDestinationPrefix("/user");
    }

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/ws")
                .setAllowedOriginPatterns("*")
                .addInterceptors(new org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor()) // HTTP 세션 인터셉터 추가
                .setHandshakeHandler(new CustomHandshakeHandler()) 
                .withSockJS();
    }

    // WebSocket 연결 시 Principal 설정을 확인하기 위한 ChannelInterceptor 추가
    @Override
    public void configureClientInboundChannel(ChannelRegistration registration) {
    	 System.out.println("configureClientInboundChannel 메서드 호출됨");
        registration.interceptors(new ChannelInterceptor() {
            @Override
            public Message<?> preSend(Message<?> message, MessageChannel channel) {
            	  System.out.println("preSend 메서드 호출됨"); // preSend 호출 로그
                StompHeaderAccessor accessor = MessageHeaderAccessor.getAccessor(message, StompHeaderAccessor.class);
                if (accessor != null && accessor.getUser() == null) {
                    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
                    if (auth != null) {
                        accessor.setUser(auth);
                        System.out.println("WebSocket 인증 사용자 설정: " + auth.getName()); // 인증 사용자 확인 로그
                    } else {
                        System.out.println("SecurityContext에 인증 정보가 없습니다."); // 인증 정보가 없을 경우
                    }
                }
                return message;
            }
        });
    }
}
