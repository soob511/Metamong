package com.mycompany.metamong.daoMain;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.metamong.dto.column.ApplyColumnDto;
import com.mycompany.metamong.dto.column.ColumnDto;

@Mapper
public interface ColumnDao {

	public List<ColumnDto> selectColumnList(int tableId);

	public int insertApplyColumn(ApplyColumnDto applyColumn);

	public List<ColumnDto> selectColumnByTable(@Param("schemaName") String schemaName, @Param("tableNo") int tableNo);
}
