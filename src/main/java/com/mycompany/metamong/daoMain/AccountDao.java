package com.mycompany.metamong.daoMain;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.metamong.dto.Pager;
import com.mycompany.metamong.dto.member.MemberDto;

@Mapper
public interface AccountDao {
	
	public int countRows();

	public List<MemberDto> selectApplyList(Pager pager);

	public List<MemberDto> selectMemberSearch(@Param("status")int status,@Param("option")String option, @Param("keyword")String keyword, @Param("pager") Pager pager);
	
	public int countMembers(@Param("status") int status, @Param("option") String option, @Param("keyword") String keyword);

	public int updateAccountStatus(@Param("MId")String MId, @Param("status")int status);

	public MemberDto selectMemberId(String mId);

	public List<MemberDto> selectAccountList(Pager pager);

	public int AccountListRows();

	public int selectAccountMembers(@Param("option") String option,@Param("keyword")  String keyword);

	public List<MemberDto> selectAccountSearch(@Param("option") String option, @Param("keyword") String keyword, @Param("pager") Pager pager);

	public int updateAccount(MemberDto members);
	
}
