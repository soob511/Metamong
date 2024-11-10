package com.mycompany.metamong.daoMain;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.metamong.dto.Pager;
import com.mycompany.metamong.dto.member.ApplyMemberDto;
import com.mycompany.metamong.dto.member.ApprovalMemberStatusDto;
import com.mycompany.metamong.dto.member.MemberDto;

@Mapper
public interface MemberDao {
	
	public MemberDto selectByMId(String mId);

	public int insertJoin(MemberDto member);

	public int selectMId(String mId);

	public int countRows();

	public List<MemberDto> selectMemberList(Pager pager);

	public List<MemberDto> selectMemberSearch(@Param("option")String option, @Param("keyword")String keyword, @Param("pager") Pager pager);
	
	public int countMembers(@Param("option") String option, @Param("keyword") String keyword, @Param("pageNo") int pageNo);

	public String selectDbaName(String dbaId);
	
	public List<MemberDto> selectActiveMember(int rowNumber);
	
	public List<ApplyMemberDto> selectApplyMember(String mRole);
	
	public List<ApprovalMemberStatusDto> selectApprovalStatus();

	public List<String> selectDbaIdByRole(String role);
}
