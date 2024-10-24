package com.mycompany.metamong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sequence")
public class SequenceController {
	
	@GetMapping("/sequenceList")
	public String sequenceList() {
		return "dbObject/sequence/sequenceList";
	}
	
	@GetMapping("/sequenceApplyList")
	public String sequenceApplyList() {
		return "dbObject/sequence/sequenceApplyList";
	}
	
	@GetMapping("/sequenceApplyDetail")
	public String sequenceApplyDetail() {
		return "dbObject/sequence/sequenceApplyDetail";
	}

}
