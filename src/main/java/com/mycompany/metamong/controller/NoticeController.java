package com.mycompany.metamong.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.metamong.dto.notice.NoticeDto;
import com.mycompany.metamong.service.NoticeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired 
	private NoticeService noticeService;
	
	@GetMapping("/noticeList")
	public String noticeList(Model model) {
		List<NoticeDto> list = noticeService.getNoticeList();
		model.addAttribute("list", list);
		
		return "notice/noticeList";
	}
	
}
