package com.mycompany.metamong.security;

import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.mycompany.metamong.dto.MemberDto;

public class MemberDetails extends User {
	
	private MemberDto member;
	
	public MemberDetails(MemberDto member, List<GrantedAuthority> authorities) {
		super(
				member.getMId(), 
				member.getMPassword(), 
				member.isMIsActive(),
				true,
				true,
				true,
				authorities
				);
		this.member = member;
	}
	
	public MemberDto geMember() {
		return member;
	}
	
}
