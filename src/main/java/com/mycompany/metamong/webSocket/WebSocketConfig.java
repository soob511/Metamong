package com.mycompany.metamong.webSocket;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

	@Override
	public void configureMessageBroker(MessageBrokerRegistry config) {
		// 메시지 브로커 설정
		config.enableSimpleBroker("/topic", "/queue"); // 구독용 경로
		config.setApplicationDestinationPrefixes("/app"); // 메시지 송신 경로
	}

	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		// WebSocket 엔드포인트 설정
		registry.addEndpoint("/ws") // 클라이언트에서 접속할 엔드포인트
				.setAllowedOriginPatterns("*").withSockJS(); // SockJS fallback 옵션
	}
}
