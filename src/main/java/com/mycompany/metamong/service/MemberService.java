package com.mycompany.metamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoMain.MemberDao;
import com.mycompany.metamong.dto.Pager;
import com.mycompany.metamong.dto.member.ApplyMemberDto;
import com.mycompany.metamong.dto.member.ApprovalMemberStatusDto;
import com.mycompany.metamong.dto.member.MemberDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
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

	public List<MemberDto> searchMember(String option, String keyword, Pager pager) {
		return memberDao.selectMemberSearch(option, keyword, pager);
	}
	
	public int countMembers(String option, String keyword, int pageNo) {
		return memberDao.countMembers(option,keyword,pageNo);
	}
	
	public String getDbaNameById(String dbaId) {
		return memberDao.selectDbaName(dbaId);
	}
	
	public MemberDto getMember(String mId) {
		return memberDao.selectByMId(mId);
	}
	
	public List<MemberDto> getActiveMember(int rowNumber) {
		return memberDao.selectActiveMember(rowNumber);
	}
	
	public List<ApplyMemberDto> getApplyMember(String mRole) {
		return memberDao.selectApplyMember(mRole);
	}
	
	public List<ApprovalMemberStatusDto> getApprovalStatus() {
		return memberDao.selectApprovalStatus();
	}
	
	public MemberDto getMemberProf(String mId) {
		MemberDto member = memberDao.selectMemberProf(mId);
		return member;
	}

	public int updateProf(MemberDto member) {
		return memberDao.updateProf(member);
	}

	public int deleteProf(MemberDto member) {
		return memberDao.deleteProf(member);
	}
}