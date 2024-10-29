package com.mycompany.metamong.daoSub3;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.index.IndexDto;

@Mapper
public interface Sub3IndexDao {
	
	public List<IndexDto> selectIndex();
	
	public List<IndexDto> selectIndexByName(String indexName);
}
