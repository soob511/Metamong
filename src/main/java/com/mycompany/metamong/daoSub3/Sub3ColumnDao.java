package com.mycompany.metamong.daoSub3;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.column.ColumnDto;

@Mapper
public interface Sub3ColumnDao {
	public List<ColumnDto> selectColumnByDic(String tableName);
}