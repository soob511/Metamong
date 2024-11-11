package com.mycompany.metamong.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.mycompany.metamong.dto.member.MemberDto;
import com.mycompany.metamong.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@ControllerAdvice
public class AllControllerAdvice {

    @Autowired
    private MemberService memberService;

    @ModelAttribute("member")
    public MemberDto addMemberToModel(Authentication auth) {
        if (auth != null && auth.isAuthenticated()) {
            String mid = auth.getName();
            MemberDto member = memberService.getMemberProf(mid);
            return member;
        }
        return null;
    }
}
