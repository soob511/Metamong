package com.mycompany.metamong.daoSub1;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.column.ColumnDto;

@Mapper
public interface Sub1ColumnDao {
	public List<ColumnDto> selectColumnName(String tableName);
	
	public List<ColumnDto> selectColumnInfo(String tableName);
}
