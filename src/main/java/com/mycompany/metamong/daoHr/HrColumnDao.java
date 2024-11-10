package com.mycompany.metamong.daoHr;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.column.ColumnDto;

@Mapper
public interface HrColumnDao {
	public List<ColumnDto> selectColumnName(String tableName);
	
	public List<ColumnDto> selectColumnInfo(String tableName);

	public int updateColumn(String usql);
}
