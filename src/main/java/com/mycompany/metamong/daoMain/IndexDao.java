package com.mycompany.metamong.daoMain;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.metamong.dto.Pager;
import com.mycompany.metamong.dto.index.ApplyIndexDetailDto;
import com.mycompany.metamong.dto.index.ApplyIndexDto;
import com.mycompany.metamong.dto.index.ApplyIndexListDto;
import com.mycompany.metamong.dto.index.IndexDto;

@Mapper
public interface IndexDao {
	
	public List<IndexDto> selectIndex();
	
	public List<IndexDto> selectIndexByName(String indexName);
	
	public List<ApplyIndexListDto> selectApplyIndex(Pager Pager);
	
	public List<ApplyIndexListDto> selectApplyIndexByParams(HashMap<String, Object> indexApplyListData);
	
	public ApplyIndexDetailDto selectApplyIndexDetail(int applyNo);
	
	public int selectTotalRows();
	
	public int insertApplyIndex(ApplyIndexDto applyIndexDto);
	
	public int insertIndex(String sqlSyn);
}
