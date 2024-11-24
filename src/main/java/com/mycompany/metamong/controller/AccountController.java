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
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.metamong.dto.Pager;
import com.mycompany.metamong.dto.member.MemberDto;
import com.mycompany.metamong.service.AccountService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/account")
public class AccountController {
	
	@Autowired
	private AccountService accountService;
	
	@GetMapping("/accountList")
	public String accountList(@RequestParam(defaultValue="1")int pageNo, HttpSession session, Model model) {
		int accountTotalRows = accountService.getAccountListRows();
		Pager pager = new Pager(10,5,accountTotalRows,pageNo);
		
		session.setAttribute("pager", pager);
		model.addAttribute("totalRows", accountTotalRows);
		
		List<MemberDto> list = accountService.getAccountList(pager);
		model.addAttribute("list", list);
		return "account/accountList";
	}
	
	@GetMapping("/accountSearch")
	public String accountSearch(@RequestParam(defaultValue = "ID") String option,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int pageNo,
			HttpSession session, Model model) {

		if (keyword == null || keyword.trim().isEmpty()) {

			int accountTotalRows = accountService.getAccountListRows();
			Pager pager = new Pager(10, 5, accountTotalRows, pageNo);

			session.setAttribute("pager", pager);
			model.addAttribute("totalRows", accountTotalRows);

			List<MemberDto> list = accountService.getAccountList(pager);
			model.addAttribute("list", list);
			return "account/accountSearch";
		} else {
			int accountSearchTotalRows = accountService.selectAccountMembers(option, keyword);
			Pager pager = new Pager(10, 5, accountSearchTotalRows, pageNo);

			model.addAttribute("totalRows", accountSearchTotalRows);

			List<MemberDto> list = accountService.searchAccountMember(option, keyword, pager);
			model.addAttribute("list", list);
			model.addAttribute("option", option);
			model.addAttribute("keyword", keyword);
			session.setAttribute("pager", pager);

			return "account/accountSearch";
		}
	}
	
	@GetMapping("/accountApplyList")
	public String accountApplyList(Model model, @RequestParam(defaultValue="1")int pageNo, HttpSession session) {
		int totalRows = accountService.getTotalRows();
		Pager pager = new Pager(10,5,totalRows,pageNo);
		
		session.setAttribute("pager", pager);
		model.addAttribute("totalRows", totalRows);
		
		List<MemberDto> list = accountService.getApplyList(pager);
		log.info(list.toString());
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
	
	@ResponseBody
	@PostMapping("/updateAccount")
	public int updateAccount(
	        @RequestParam("mId") String mId,
	        @RequestParam("mRole") String mRole,
	        @RequestParam("teamName") String teamName,
	        @RequestParam("mEmpId") String mEmpId,
	        @RequestParam("mTel") String mTel,
	        @RequestParam("mIsactive") int mIsActive 
	) throws Exception {

		MemberDto members = new MemberDto();
	    members.setMId(mId);
	    members.setMRole(mRole);
	    members.setTeamName(teamName);
	    members.setMEmpId(mEmpId);
	    members.setMTel(mTel);
	    members.setMIsActive(mIsActive);

	    return accountService.updateAccount(members);
	}
}
