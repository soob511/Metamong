package com.mycompany.metamong.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	@GetMapping("/accountApplySearch")
    public String memberSearch(
    		@RequestParam(defaultValue="-1") int status, 
    		@RequestParam(defaultValue="ID") String option, 
    		@RequestParam(defaultValue="") String keyword,
    		@RequestParam(defaultValue="1")int pageNo,
    		HttpSession session,
    		Model model) {
	

	int pagerTotalRows = accountService.countMembers(status,option, keyword);
	Pager pager = new Pager(10, 5,pagerTotalRows, pageNo);
	
	model.addAttribute("totalRows", pagerTotalRows);

	
    List<MemberDto> list = accountService.searchMember(status,option,keyword,pager);
    model.addAttribute("list", list);
    model.addAttribute("option", option);
    session.setAttribute("pager", pager);
    
	return "account/accountApplySearch";
	}
	
	@PostMapping("/accountApplyProcess")
	public ResponseEntity<String> accountApplyProcess(@RequestParam String MId, @RequestParam int status) {
		
		accountService.updateaccountStatus(MId, status);
		
		return ResponseEntity.ok("/Metamong/account/accountApplyList");
	}
}
