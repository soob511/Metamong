package com.mycompany.metamong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller("/account")
public class AccountController {
	
	@GetMapping("/accountManage")
	public String accountManage() {
		
		return "account/accountManage";
	}
	@GetMapping("/applyList")
	public String applyList() {
		
		return "account/applyList";
	}

}
