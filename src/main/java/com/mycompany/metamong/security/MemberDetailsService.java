package com.mycompany.metamong.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoMain.MemberDao;
import com.mycompany.metamong.dto.member.MemberDto;

import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberDetailsService implements UserDetailsService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public UserDetails loadUserByUsername(String mId) 
			throws UsernameNotFoundException {
		
		MemberDto member = memberDao.selectByMId(mId);
		if (member == null) {
			throw new UsernameNotFoundException("멤버 아이디를 찾을수 없습니다");
		}
		
		List<GrantedAuthority> authorities = new ArrayList<>(); 
		authorities.add(new SimpleGrantedAuthority(member.getMRole()));
		MemberDetails memberDetails = new MemberDetails(member, authorities);
		
		return memberDetails;
	}
}
