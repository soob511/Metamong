package com.mycompany.metamong.daoSub2;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.column.ColumnDto;

@Mapper
public interface PmsColumnDao {
	public List<ColumnDto> selectColumnName(String tableName);
	
	public List<ColumnDto> selectColumnInfo(String tableName);

	public int updateColumn(String usql);

}
