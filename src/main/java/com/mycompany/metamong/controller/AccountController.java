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
import com.mycompany.metamong.dto.member.MemberDto;
import com.mycompany.metamong.service.AccountService;

@Controller
@RequestMapping("/account")
public class AccountController {
	
	@Autowired
	private AccountService accountService;
	
	@GetMapping("/accountManage")
	public String accountManage() {
		
		return "account/accountManage";
	}
	
	@GetMapping("/accountApplyList")
	public String accountApplyList(Model model, @RequestParam(defaultValue="1")int pageNo, HttpSession session) {
		int totalRows = accountService.getTotalRows();
		Pager pager = new Pager(10,5,totalRows,pageNo);
		
		session.setAttribute("pager", pager);
		model.addAttribute("totalRows", totalRows);
		
		List<MemberDto> list = accountService.getApplyList(pager);
		model.addAttribute("list", list);
		return "account/accountApplyList";
	}

}
