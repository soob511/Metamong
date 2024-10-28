package com.mycompany.metamong.daoMain;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.CodeDto;

@Mapper
public interface CodeDao {
	
	public List<CodeDto> selectCodeList();
	
}
