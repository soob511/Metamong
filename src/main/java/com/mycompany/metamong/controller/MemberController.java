package com.mycompany.metamong.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.metamong.dto.JoinFormDto;
import com.mycompany.metamong.dto.MemberDto;
import com.mycompany.metamong.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService MemberService;
	
	@GetMapping("loginForm")
	public String loginForm() {
		return "member/loginForm";
	}
	
	@GetMapping("/joinForm")
	public String joinForm() {
		return "member/joinForm";
	}
	
	@ResponseBody
	@PostMapping("/join")
	public int join(@RequestBody JoinFormDto form) {
		log.info("실행");
		log.info(form.toString());
		MemberDto member = new MemberDto();
		
		member.setMId(form.getMId());
		member.setMName(form.getMName());
		
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		String password = form.getMPassword();
		password = passwordEncoder.encode(password);
		member.setMPassword(password);
				
		member.setTeamId(form.getTeamId());
		member.setMEmpId(form.getMEmpId());
		member.setMTel(form.getMTel());
		member.setMRole(form.getMRole());
		member.setMIsActive(1);
		member.setMApplydate(new Date());
		
		return MemberService.join(member);
	}
	
	
	@GetMapping("memberList")
	public String memberList() {
		return "member/memberList";
	}
}
