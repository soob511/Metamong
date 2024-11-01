package com.mycompany.metamong.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.member.MemberDto;

@Mapper
public interface MemberDao {
	
	public MemberDto selectByMId(String mId);

	public int insertJoin(MemberDto member);

	public int selectMId(String mId);
	
}
