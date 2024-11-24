package com.mycompany.metamong.controller;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.metamong.dto.Pager;
import com.mycompany.metamong.dto.applyList.ApprovalStatusDto;
import com.mycompany.metamong.dto.applyList.DbObjApprovalStatusDto;
import com.mycompany.metamong.dto.member.ApplyMemberDto;
import com.mycompany.metamong.dto.member.ApprovalMemberStatusDto;
import com.mycompany.metamong.dto.member.MemberDto;
import com.mycompany.metamong.dto.notice.NoticeDto;
import com.mycompany.metamong.enums.SchemaEnum;
import com.mycompany.metamong.service.ApplyService;
import com.mycompany.metamong.service.MemberService;
import com.mycompany.metamong.service.NoticeService;

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
	public String index(
			HttpServletRequest request, 
			HttpServletResponse response, 
			Authentication authentication
			) throws IOException {
		 if (authentication != null && authentication.isAuthenticated()) {
		        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		        
		        for (GrantedAuthority authority : authorities) {
		            if (authority.getAuthority().equals("ROLE_ADMIN")) {
		                response.sendRedirect("/Metamong/homeAdmin");
		                return null;
		            } else if (authority.getAuthority().equals("ROLE_DBA")) {
		                response.sendRedirect("/Metamong/homeDBA");
		                return null;
		            } else if (authority.getAuthority().equals("ROLE_USER")) {
		                response.sendRedirect("/Metamong/homeUser");
		                return null;
		            }
		        }
		    }
		    return "member/loginForm";
	}

	@Secured("ROLE_USER")
	@GetMapping("/homeUser")
	public String homeUser(Model model, Authentication auth) {
		String userName = memberService.getDbaNameById(auth.getName());
		Pager pager = new Pager(8, 10, 10, 1); 
		List<NoticeDto> noticeList = noticeService.getNoticeList(pager);

		model.addAttribute("userName", userName);
		model.addAttribute("pager", pager);
		model.addAttribute("schemaEnum", SchemaEnum.values());
		model.addAttribute("noticeList", noticeList);
	    return "home/homeUser";
	}
	
	@ResponseBody
	@GetMapping("/getApprovalStatus")
	public ApprovalStatusDto getApprovalStatus(Authentication auth) {
		String userId = auth.getName();
		MemberDto userInfo = memberService.getMember(userId);
		if (userInfo.getMRole().equals("ROLE_USER")) {
			return applyService.countApprovalStatus(userId);			
		} else {
			userId = "";
			return applyService.countApprovalStatus(userId);						
		}
	}
	
	@Secured("ROLE_DBA")
	@GetMapping("/homeDBA")
	public String homeDBA(Model model, Authentication auth) {
		String userName = memberService.getDbaNameById(auth.getName());
		Pager pager = new Pager(8, 10, 10, 1); 
		List<NoticeDto> noticeList = noticeService.getNoticeList(pager);
		model.addAttribute("userName", userName);
		model.addAttribute("pager", pager);
		model.addAttribute("schemaEnum", SchemaEnum.values());
		model.addAttribute("noticeList", noticeList);
		return "home/homeDBA";
	}
	
	@ResponseBody
	@GetMapping("/getDbObjApprovalStatus")
	public List<DbObjApprovalStatusDto> getDbObjApprovalStatus() {
		List<DbObjApprovalStatusDto> dbObjApprovalList = applyService.getDbObjAwaitStatus();
		return dbObjApprovalList; 
	}
	
	@Secured("ROLE_ADMIN")
	@GetMapping("/homeAdmin")
	public String homeAdmin(Model model, Authentication auth) {
		String userName = memberService.getDbaNameById(auth.getName());
		Pager pager = new Pager(8, 10, 10, 1); 
		List<NoticeDto> noticeList = noticeService.getNoticeList(pager);
		List<MemberDto> memberList = memberService.getActiveMember(10);
		model.addAttribute("userName", userName);
		model.addAttribute("pager", pager);
		model.addAttribute("schemaEnum", SchemaEnum.values());
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("memberList", memberList);
		return "home/homeAdmin";
	}
	
	@ResponseBody
	@GetMapping("/getSignupStatus")
	public Map<String, Object> getSignupStatus(@RequestParam String roleUser, @RequestParam String roleDba) {
		List<ApplyMemberDto> userList = memberService.getApplyMember(roleUser);
		List<ApplyMemberDto> dbaList = memberService.getApplyMember(roleDba);
		log.info("실행" + userList + dbaList);
		Map<String, Object> memberList = new HashMap<String, Object>();
		memberList.put("userList", userList);
		memberList.put("dbaList", dbaList);	
		return memberList;
	}
	
	@ResponseBody
	@GetMapping("/getApprovalMemberStatus")
	public List<ApprovalMemberStatusDto> getApprovalMemberStatus() {
		return memberService.getApprovalStatus();
	}
}
