package com.mycompany.metamong.daoMain;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.metamong.dto.index.ApplyIndexDto;
import com.mycompany.metamong.dto.index.ApplyIndexListDto;
import com.mycompany.metamong.dto.index.IndexDto;

@Mapper
public interface IndexDao {
	
	public List<IndexDto> selectIndex();
	
	public List<IndexDto> selectIndexByName(String indexName);
	
	public int insertApplyIndex(ApplyIndexDto applyIndexDto);
	
	public int insertIndex(String sqlSyn);
}
