package com.mycompany.metamong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.dao.MemberDao;
import com.mycompany.metamong.dto.MemberDto;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao memberDao;

	public int join(MemberDto member) {
		return memberDao.insertJoin(member);
	}
	
}
