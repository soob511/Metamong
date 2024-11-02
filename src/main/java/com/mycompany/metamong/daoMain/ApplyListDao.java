package com.mycompany.metamong.daoMain;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.applyList.ApplyListDto;
import com.mycompany.metamong.dto.applyList.ApplyTableDeatilDto;
import com.mycompany.metamong.dto.code.ApplyCodeDto;
import com.mycompany.metamong.dto.table.ApplyTableDto;

@Mapper
public interface ApplyListDao {

	public List<ApplyCodeDto> selectApplyCodeList();

	public List<ApplyTableDto> selectApplyTableList();

	public List<ApplyTableDto> selectApplyTableSearch(Map<String, String> form);

	public ApplyTableDeatilDto selectTableListDetail(int applyNo);
	
	public int insertApplyList(ApplyListDto apply);
}
