package com.mycompany.metamong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/index")
public class IndexController {
	
	@GetMapping("/indexList")
	public String navToIndexList() {
		return "dbObject/index/indexList";
	}
	
	@GetMapping("/addIndexForm")
	public String addIndexForm() {
		return "dbObject/index/addIndexForm";
	}
}
