package com.mycompany.metamong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/table")
public class TableController {
	
	@GetMapping("/tableList")
	public String tableList() {
		return "dbObject/table/tableList";
	}
	
	@GetMapping("/tableCompare")
	public String tableCompare() {
		return "dbObject/table/tableCompare";
	}
	
	@GetMapping("/tableAddForm")
	public String tableAddForm() {
		return "dbObject/table/tableAddForm";
	}
	
	@GetMapping("/tableUpdateForm")
	public String tableUpdateForm() {
		return "dbObject/table/tableUpdateForm";
	}
	
	@GetMapping("/tableApplyList")
	public String tableApplyList() {
		return "dbObject/table/tableApplyList";
	}
	
	@GetMapping("/tableApplyDetail")
	public String tableApplyDetail() {
		return "dbObject/table/tableApplyDetail";
	}

}
