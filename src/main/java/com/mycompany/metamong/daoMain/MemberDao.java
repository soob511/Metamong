package com.mycompany.metamong.daoMain;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.MemberDto;

@Mapper
public interface MemberDao {
	
	public MemberDto selectByMId(String mId);

	public int insertJoin(MemberDto member);

	public int selectMId(String mId);
	
}
