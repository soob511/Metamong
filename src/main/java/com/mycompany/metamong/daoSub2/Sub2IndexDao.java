package com.mycompany.metamong.daoSub2;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.metamong.dto.index.IndexDto;

@Mapper
public interface Sub2IndexDao {
	
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
}
