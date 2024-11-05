package com.mycompany.metamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoMain.MemberDao;
import com.mycompany.metamong.dto.Pager;
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

	public int getTotalRows() {
		return memberDao.countRows();
	}

	public List<MemberDto> getMemberList(Pager pager) {
		return memberDao.selectMemberList(pager);
	}

	public List<MemberDto> searchMember(String option, String keyword) {
		return memberDao.selectMemberSearch(option, keyword);
	}

	public MemberDto getDbaNameById(String dbaId) {
		return memberDao.selectDbaName(dbaId);
	}
}
