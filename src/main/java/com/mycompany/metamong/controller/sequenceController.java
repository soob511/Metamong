package com.mycompany.metamong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sequence")
public class sequenceController {
	
	@GetMapping("/sequenceList")
	public String sequenceList() {
		return "dbObject/sequence/sequenceList";
	}
	
	@GetMapping("/sequenceApplyList")
	public String sequenceApplyList() {
		return "dbObject/sequence/sequenceApplyList";
	}
	
	@GetMapping("/sequenceDetail")
	public String sequenceDetail() {
		return "dbObject/sequence/sequenceDetail";
	}

}
