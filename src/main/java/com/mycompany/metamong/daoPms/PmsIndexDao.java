package com.mycompany.metamong.daoPms;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.metamong.dto.index.IndexDto;

@Mapper
public interface PmsIndexDao {
	
	public List<IndexDto> selectIndex();
	
	public List<IndexDto> selectIndexByDic(
			@Param("indexName") String indexName, 
			@Param("columnName") String columName, 
			@Param("tableName") String tableName
			);
	
	public List<IndexDto> selectIndexNoPk(
			@Param("indexName") String indexName, 
			@Param("columnName") String columName, 
			@Param("tableName") String tableName
			);
	
	public int createIndex(String sqlSyn);
	
	public IndexDto selectDuplicateIndex(String indexName);
}
