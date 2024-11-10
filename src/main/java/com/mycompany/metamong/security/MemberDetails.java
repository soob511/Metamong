package com.mycompany.metamong.security;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.mycompany.metamong.dto.member.MemberDto;

public class MemberDetails extends User {
	private MemberDto member;
	private List<GrantedAuthority> authorities;
	
	public MemberDetails(MemberDto member, List<GrantedAuthority> authorities) {
		super(
				member.getMId(), 
				member.getMPassword(), 
				true,
				true,
				true,
				true,
				authorities
				);
		this.member = member;
		this.authorities = authorities;
	}
	
	public MemberDto getMember() {
		return member;
	}
	
	public Collection<GrantedAuthority> getAuthorities() {
		return authorities;
	}
	
}
