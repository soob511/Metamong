package com.mycompany.metamong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoMain.MemberDao;
import com.mycompany.metamong.dto.member.MemberDto;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao memberDao;

	public int join(MemberDto member) {
		return memberDao.insertJoin(member);
	}

	public int getMId(String mId) {
		return memberDao.selectMId(mId);
	}
	
}
