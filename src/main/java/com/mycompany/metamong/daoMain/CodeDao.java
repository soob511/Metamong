package com.mycompany.metamong.daoMain;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.metamong.dto.code.ApplyCodeDto;
import com.mycompany.metamong.dto.code.CodeDto;

@Mapper
public interface CodeDao {
	
	public List<CodeDto> selectCodeList();
	
	public CodeDto selectCodeByNo(int codeNo);

	public List<CodeDto> selectCodeSearch(@Param(value="keyword") String keyword, @Param(value="option") int option);
	
	public List<CodeDto> selectActiveCodes();

	public List<CodeDto> selectCodeLoadSearch(String keyword);

	public int insertApplyCode(ApplyCodeDto code);

	public int updateApplyCode(ApplyCodeDto code);

}
