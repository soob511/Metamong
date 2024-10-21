package com.mycompany.metamong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/table")
public class TableController {
	@GetMapping("")
	public String tableList() {
		return "dbObject/table/tableList";
	}
}
