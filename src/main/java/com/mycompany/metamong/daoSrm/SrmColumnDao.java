package com.mycompany.metamong.daoSrm;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.column.ColumnDto;

@Mapper
public interface SrmColumnDao {
	public List<ColumnDto> selectColumnName(String tableName);
	
	public List<ColumnDto> selectColumnInfo(String tableName);

	public ColumnDto selectColumn(String tableId);

	public int updateColumn(String usql);
}
