package com.mycompany.metamong.daoMain;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.Pager;
import com.mycompany.metamong.dto.member.MemberDto;

@Mapper
public interface MemberDao {
	
	public MemberDto selectByMId(String mId);

	public int insertJoin(MemberDto member);

	public int selectMId(String mId);

	public int countRows();

	public List<MemberDto> selectMemberList(Pager pager);
}
