package com.mycompany.metamong.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.metamong.dto.Pager;
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
	public String noticeList(Model model, @RequestParam(defaultValue="1")int pageNo, HttpSession session) {
		
		int totalRows = noticeService.getTotalRows();
		Pager pager = new Pager(10,5,totalRows,pageNo);
		
		session.setAttribute("pager", pager);
		model.addAttribute("totalRows", totalRows);
		
		List<NoticeDto> list = noticeService.getNoticeList(pager);
		model.addAttribute("list", list);
		
		return "notice/noticeList";
	}	
}
