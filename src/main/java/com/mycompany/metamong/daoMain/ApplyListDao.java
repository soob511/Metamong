package com.mycompany.metamong.daoMain;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.metamong.dto.applyList.ApplyListDto;
import com.mycompany.metamong.dto.applyList.ApplyTableDeatilDto;
import com.mycompany.metamong.dto.index.ApplyIndexDetailDto;
import com.mycompany.metamong.dto.index.ApplyIndexListDto;
import com.mycompany.metamong.dto.table.ApplyTableDto;

@Mapper
public interface ApplyListDao {

	public int insertApplyList(ApplyListDto apply);

	public List<ApplyTableDto> selectApplyTableList();

	public List<ApplyTableDto> selectApplyTableSearch(Map<String, String> form);

	public ApplyTableDeatilDto selectTableListDetail(int applyNo);
	
	public List<ApplyIndexListDto> selectApplyIndex();
	
	public List<ApplyIndexListDto> selectApplyIndexByParams(HashMap<String, Object> indexApplyListData);
	
	public ApplyIndexDetailDto selectApplyIndexDetail(int applyNo);

}
