package com.mycompany.metamong.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.metamong.dto.Pager;
import com.mycompany.metamong.dto.applyList.ApprovalStatusCountDto;
import com.mycompany.metamong.dto.member.ApprovalStatusDto;
import com.mycompany.metamong.dto.notice.NoticeDto;
import com.mycompany.metamong.enums.SchemaEnum;
import com.mycompany.metamong.service.ApplyService;
import com.mycompany.metamong.service.MemberService;
import com.mycompany.metamong.service.NoticeService;
import com.mycompany.metamong.service.TableService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ApplyService applyService;
	
	@RequestMapping("")
	public String index() {
		return "member/loginForm";
	}

	@Secured("ROLE_USER")
	@GetMapping("/homeUser")
	public String homeUser(Model model, Authentication auth) {
		String userName = memberService.getDbaNameById(auth.getName());
		Pager pager = new Pager(8, 10, 10, 1); 
		List<NoticeDto> noticeList = noticeService.getNoticeList(pager);
		
		model.addAttribute("pager", pager);
		model.addAttribute("userName", userName);
		model.addAttribute("schemaEnum", SchemaEnum.values());
		model.addAttribute("noticeList", noticeList);
		log.info("실행");
		return "home/homeUser";
	}
	
	@GetMapping("/countApprovalStatus")
	public ApprovalStatusDto countApprovalStatus(Authentication auth) {
		return applyService.countApprovalStatus(auth.getName());
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
