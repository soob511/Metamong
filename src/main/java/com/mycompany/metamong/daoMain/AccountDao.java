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

	public List<MemberDto> selectMemberSearch(@Param("option")String option, @Param("keyword")String keyword, @Param("pager") Pager pager);
	
	public int countMembers(@Param("option") String option, @Param("keyword") String keyword, @Param("pageNo") int pageNo);
	
}
