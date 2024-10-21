package com.mycompany.metamong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller	
@RequestMapping("/notice")
public class NoticeController {
	@RequestMapping("/addNoticeForm")
	public String addNoticeForm() {
		return "notice/addNoticeForm";
	}
	@RequestMapping("/noticeList")
	public String noticeList() {
		
		return "notice/noticeList";
	}
	@RequestMapping("/noticeDetail")
	public String noticeDetail() {
		
		return "notice/noticeDetail";
	}

}
