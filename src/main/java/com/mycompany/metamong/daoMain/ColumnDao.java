package com.mycompany.metamong.daoMain;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.metamong.dto.column.ApplyColumnDto;
import com.mycompany.metamong.dto.column.ColumnDto;
import com.mycompany.metamong.enums.SchemaEnum;

@Mapper
public interface ColumnDao {

	public List<ColumnDto> selectColumnList(int tableId);

	public int insertApplyColumn(ApplyColumnDto applyColumn);

	public List<ColumnDto> selectColumnByTable(@Param("schemaName") SchemaEnum schemaName, @Param("tableNo") int tableNo);
	
	public List<ColumnDto> selectColumnByApplyNo(int applyNo);

	public List<ColumnDto> selectApplyColumn(int applyNo);

	public int insertColumn(ColumnDto column);
	
	public String selectColumnName(@Param("tableNo")int tableNo, @Param("colId")String colId);

	public ColumnDto selectColumn(@Param("schema")String schema,@Param("tableId")String tableId,@Param("colId")String colId);

}
