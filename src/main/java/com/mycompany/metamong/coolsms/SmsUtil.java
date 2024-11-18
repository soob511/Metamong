package com.mycompany.metamong.coolsms;




import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;


import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Slf4j
@Component
public class SmsUtil {
	@Value("${coolsms.api.key}")
    private String apiKey;
    @Value("${coolsms.api.secret}")
    private String apiSecretKey;
    @Value("${coolsms.from.number}")
    private String number;
    
    final DefaultMessageService messageService;
    
    public SmsUtil() {
        this.messageService = NurigoApp.INSTANCE.initialize("NCSUK70GRQNKWTAY", "ACE0LK88IUMOJX8RAMGGJTNHI7OMFNGH", "https://api.coolsms.co.kr");
    }

    public SingleMessageSentResponse sendOne(String to, String verificationCode) {
        Message message = new Message();
        
        message.setFrom(number);
        message.setTo(to);
        message.setText("[Metamong] 아래의 인증번호를 입력해주세요\n" + verificationCode);

        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
        
        return response;
    }
    
    
}