package com.mycompany.metamong.daoMain;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.column.ApplyColumnDto;
import com.mycompany.metamong.dto.column.ColumnDto;

@Mapper
public interface ColumnDao {

	public List<ColumnDto> selectColumnList(int tableId);

	public int insertApplyColumn(ApplyColumnDto applyColumn);

	public List<ColumnDto> selectColumnByTable(HashMap<String, Object> colParams);
}
