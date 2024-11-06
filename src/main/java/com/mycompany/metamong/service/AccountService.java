package com.mycompany.metamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoMain.AccountDao;
import com.mycompany.metamong.dto.Pager;
import com.mycompany.metamong.dto.member.MemberDto;

@Service
public class AccountService {
	
	@Autowired
	private AccountDao accountDao;

	public int getTotalRows() {
		return accountDao.countRows();
	}

	public List<MemberDto> getApplyList(Pager pager) {
		return accountDao.selectApplyList(pager);
	}
	
	public List<MemberDto> searchMember(String option, String keyword, Pager pager) {
		return accountDao.selectMemberSearch(option, keyword, pager);
	}
	
	public int countMembers(String option, String keyword, int pageNo) {
		return accountDao.countMembers(option,keyword,pageNo);
	}
}