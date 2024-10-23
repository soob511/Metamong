package com.mycompany.metamong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/index")
public class IndexController {
	
	@GetMapping("/indexList")
	public String indexList() {
		return "dbObject/index/indexList";
	}
	
	@GetMapping("/indexAddForm")
	public String indexAddForm() {
		return "dbObject/index/indexAddForm";
	}
	
	@GetMapping("/indexDeleteForm")
	public String indexDeleteForm() {
		return "dbObject/index/indexDeleteForm";
	}
	
	@GetMapping("/indexApplyList")
	public String indexApplyList() {
		return "dbObject/index/indexApplyList";
	}
	
	@GetMapping("/indexDetail")
	public String indexDetail() {
		return "dbObject/index/indexDetail";
	}
}
