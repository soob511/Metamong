package com.mycompany.metamong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/account")
public class AccountController {
	
	@GetMapping("/accountManage")
	public String accountManage() {
		
		return "account/accountManage";
	}
	
	@GetMapping("/accountApplyList")
	public String accountApplyList() {
		
		return "account/accountApplyList";
	}

}
