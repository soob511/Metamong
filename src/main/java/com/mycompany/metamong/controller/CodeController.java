package com.mycompany.metamong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/code")
public class CodeController {
	
	@GetMapping("/codeList")
	public String codeList() {
		return "code/codeList";
	}
	
	@GetMapping("/codeAddForm")
	public String codeAddForm() {
		return "code/codeAddForm";
	}
	
	@GetMapping("/codeUpdateForm")
	public String codeUpdateForm() {
		return "code/codeUpdateForm";
	}

	@GetMapping("/codeCompare")
	public String codeCompare() {
		return "code/codeCompare";
	}
	
	@GetMapping("/codeApplyList")
	public String codeApplyList() {
		return "code/codeApplyList";
	}
	
}
