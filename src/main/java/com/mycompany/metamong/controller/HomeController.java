package com.mycompany.metamong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {

	@RequestMapping("")
	public String index() {
		return "member/loginForm";
	}

	@GetMapping("/homeUser")
	public String homeUser() {
		log.info("실행");
		return "home/homeUser";
	}
	
	@GetMapping("/homeDBA")
	public String homeDBA() {
		log.info("실행");
		return "home/homeDBA";
	}
	
	@GetMapping("/homeAdmin")
	public String homeAdmin() {
		log.info("실행");
		return "home/homeAdmin";
	}
}
