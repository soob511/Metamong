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
	
	public List<MemberDto> searchMember(int status,String option, String keyword, Pager pager) {
		return accountDao.selectMemberSearch(status,option, keyword, pager);
	}
	
	public int countMembers(int status, String option, String keyword) {
		return accountDao.countMembers(status,option,keyword);
	}

	public void updateaccountStatus(String MId, int status) {
		accountDao.updateAccountStatus(MId, status);
	}

	public MemberDto getMemberId(String mId) {
		return accountDao.selectMemberId(mId);
		
	}

	public List<MemberDto> getAccountList(Pager pager) {
		return accountDao.selectAccountList(pager);
	}

	public int getAccountListRows() {
		return accountDao.AccountListRows();
	}

	public int selectAccountMembers(String option, String keyword) {
		return accountDao.selectAccountMembers(option,keyword);
		
	}

	public List<MemberDto> searchAccountMember(String option, String keyword, Pager pager) {
		return accountDao.selectAccountSearch(option, keyword, pager);
	}

	public int updateAccount(MemberDto members) {
		return accountDao.updateAccount(members);
	}
}
