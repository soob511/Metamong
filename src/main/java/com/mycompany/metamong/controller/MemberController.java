package com.mycompany.metamong.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.metamong.dto.Pager;
import com.mycompany.metamong.dto.member.JoinFormDto;
import com.mycompany.metamong.dto.member.MemberDto;
import com.mycompany.metamong.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("loginForm")
	public String loginForm() {
		return "member/loginForm";
	}
	
	@GetMapping("/joinForm")
	public String joinForm() {
		return "member/joinForm";
	}
	
	@ResponseBody
	@PostMapping("/idCheck")
	public int idCheck(@RequestParam String MId) {
		log.info("실행");
		return memberService.getMId(MId);
	}
	
	@ResponseBody
	@PostMapping("/join")
	public int join(@RequestBody JoinFormDto form) {
		log.info("실행");
		log.info(form.toString());
		MemberDto member = new MemberDto();
		
		member.setMId(form.getMId());
		member.setMName(form.getMName());
		
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		String password = form.getMPassword();
		password = passwordEncoder.encode(password);
		member.setMPassword(password);
				
		member.setTeamId(form.getTeamId());
		member.setMEmpId(form.getMEmpId());
		member.setMTel(form.getMTel());
		member.setMRole(form.getMRole());
		member.setMIsActive(1);
		member.setMApplydate(new Date());
		
		return 	memberService.join(member);
	}
	
	@GetMapping("/memberList")
	public String memberList(Model model, @RequestParam(defaultValue="1")int pageNo, HttpSession session) {
		
		int totalRows = memberService.getTotalRows();
		Pager pager = new Pager(10,5,totalRows,pageNo);
		
		session.setAttribute("pager", pager);
		model.addAttribute("totalRows", totalRows);
		
		List<MemberDto> list = memberService.getMemberList(pager);
		model.addAttribute("list", list);
		
		return "member/memberList";
	}
	
	
	@GetMapping("/memberSearch")
	    public String memberSearch(
	    		@RequestParam(defaultValue="") String option, 
	    		@RequestParam(defaultValue="") String keyword,
	    		@RequestParam(defaultValue="1")int pageNo,
	    		HttpSession session,
	    		Model model) {
		
		if (keyword == null || keyword.trim().isEmpty()) {
	        
			int totalRows = memberService.getTotalRows();
			Pager pager = new Pager(10,5,totalRows,pageNo);
			model.addAttribute("totalRows", totalRows);
			
			List<MemberDto> list = memberService.getMemberList(pager);
			model.addAttribute("list", list);
			session.setAttribute("pager", pager);
	        return "member/memberSearch";
	    }
		else {
		
		int pagerTotalRows = memberService.countMembers(option, keyword,pageNo);
		Pager pager = new Pager(10, 5,pagerTotalRows, pageNo);
		
		model.addAttribute("totalRows", pagerTotalRows);
		pager.setTotalRows(pagerTotalRows);
		
        List<MemberDto> list = memberService.searchMember(option,keyword,pager);
        model.addAttribute("list", list);
        model.addAttribute("option", option);
        session.setAttribute("option", option);
        session.setAttribute("pager", pager);
        	return "member/memberSearch";
			}	    
		}
}
