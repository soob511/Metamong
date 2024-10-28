package com.mycompany.metamong.daoMain;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.ApplyCodeDto;
import com.mycompany.metamong.dto.CodeDto;

@Mapper
public interface CodeDao {
	
	public List<CodeDto> selectCodeList();

	public int insertApplyCode(ApplyCodeDto code);
	
	public List<CodeDto> selectActiveCodes();

	public List<CodeDto> selectCodeLoadSearch(String keyword);
	
}
