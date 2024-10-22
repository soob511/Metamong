package com.mycompany.metamong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member")
public class MemberController {
	
	@GetMapping("/joinForm")
	public String joinForm() {
		return "member/joinForm";
	}
	
	@GetMapping("loginForm")
	public String navToLogin() {
		return "member/loginForm";
	}
	
	@GetMapping("memberList")
	public String navToMemberList() {
		return "member/memberList";
	}
}
