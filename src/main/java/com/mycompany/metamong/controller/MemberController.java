package com.mycompany.metamong.controller;

import java.util.Date;
import java.util.List;
import java.util.NoSuchElementException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.ValidationUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import com.mycompany.metamong.coolsms.SmsUtil;

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
	@Autowired
	private SmsUtil smsUtil;
	
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
	
	@RequestMapping("/getMemberProf")
	public String getMemberProf(HttpServletResponse response, Model model, Authentication auth) throws Exception {
		
		MemberDto member = memberService.getMemberProf(auth.getName());
		model.addAttribute("member",member);
		
		String contentType =member.getProfFiletype();
		response.setContentType(contentType);
		ServletOutputStream out = response.getOutputStream();
		out.write(member.getProfFiledata());
		out.flush();
		out.close();
		
		return "common/header";
	}
	
	@RequestMapping("/getMemberProfileImage")
	public void getMemberProf(@RequestParam("mId") String mId, HttpServletResponse response) throws Exception {
	    MemberDto member = memberService.getMemberProfileImage(mId);
	    
	    if (member != null && member.getProfFiledata() != null) {
	        response.setContentType(member.getProfFiletype());
	        ServletOutputStream out = response.getOutputStream();
	        out.write(member.getProfFiledata());
	        out.flush();
	        out.close();
	    } else {
	        response.sendRedirect("/resources/image/general_prof.png");
	    }
	}

	@ResponseBody
	@PostMapping("/updateProf")
	public int updateProf(
			@ModelAttribute MemberDto members) throws Exception {
		MemberDto member = new MemberDto();
		
		member.setMId(members.getMId());
		
		MultipartFile profFile = members.getProfFile();
		if(profFile !=null && !profFile.isEmpty()) {
		member.setProfFilename(profFile.getOriginalFilename());
	    member.setProfFiletype(profFile.getContentType());
	    member.setProfFiledata(profFile.getBytes());
		}
		return memberService.updateProf(member);
	}
	
	@ResponseBody
	@PostMapping("/deleteProf")
	public int deleteProf(
			@ModelAttribute MemberDto members) throws Exception {
		MemberDto member = new MemberDto();
		
		member.setMId(members.getMId());
		
		if(members.getDeleteProf()==1) {
			member.setProfFilename(null);
			member.setProfFiletype(null);
			member.setProfFiledata(null);
		}
		return memberService.deleteProf(member);
	}
	
	@ResponseBody
	@PostMapping("/checkValidUser")
	public int checkValidUser(@RequestParam String mId, @RequestParam String mTel) {
		MemberDto member = memberService.checkValidMember(mId, mTel);
		if (member != null) {
			return 1;
		} else {
			return 0;
		}
	}
	
	@PostMapping("/resetUserPassword")
	public String resetUserPassword(MemberDto member) {
		member.setMId(member.getCheckId());
		PasswordEncoder passwordEncoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		String password = passwordEncoder.encode(member.getNewPassword());
		member.setMPassword(password);
		memberService.resetPassword(member);
		return "member/loginForm";
	}
	
	@PostMapping("/sendSms")
	public ResponseEntity<?> sendSmsToFindEmail(MemberDto requestDto) {
        
        MemberDto member = memberService.checkValidMember(requestDto.getMId(), requestDto.getMTel());
        if (member == null) throw new NoSuchElementException("회원이 존재하지 않습니다.");
        String MTel = requestDto.getMTel().replaceAll("-","");
		
        String verificationCode = Integer.toString((int)(Math.random() * (999999 - 100000 + 1)) + 100000);
        smsUtil.sendOne(MTel, verificationCode);
        
        return ResponseEntity.ok().body(verificationCode);
    }
	
}