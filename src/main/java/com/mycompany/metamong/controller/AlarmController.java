package com.mycompany.metamong.controller;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AlarmController {

	private final SimpMessagingTemplate messagingTemplate;

	@Autowired
	public AlarmController(SimpMessagingTemplate messagingTemplate) {
		this.messagingTemplate = messagingTemplate;
	}

	@MessageMapping("/sendMessage")
	@SendTo("/topic/recieveMessage")
	public String sendMessage(String message) {
		log.info("알림실행");
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("content", "Hello, " + message);
		return jsonObject.toString();
	}

	// 특정 이벤트 발생 시 알림을 보내는 메서드
	public void sendDba(String message, List<String> dbaId) {
		log.info("알림실행");
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("content", message);
		for (String dba : dbaId) {
			messagingTemplate.convertAndSendToUser(dba, "/member/topic/recieveMessage", jsonObject.toString());
		}
	}

}
