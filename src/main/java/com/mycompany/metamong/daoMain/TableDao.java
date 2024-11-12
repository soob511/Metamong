package com.mycompany.metamong.daoMain;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.metamong.dto.table.ApplyTableDto;
import com.mycompany.metamong.dto.table.TableDto;
import com.mycompany.metamong.dto.table.TableRewriteDto;
import com.mycompany.metamong.enums.SchemaEnum;

@Mapper
public interface TableDao {

	public List<TableDto> selectTableList();

	public List<TableDto> selectTableSearch(@Param(value = "content") String content,@Param(value = "schema") String schema);

	public int insertApplyTable(ApplyTableDto applyTable);

	public List<TableDto> selectTableListBySchema(SchemaEnum schemaName);
	
	public TableDto selectTableInfo(@Param("tableName")String tableName, @Param("schemaName")String schemaName);
	
	public TableDto selectTableByApplyNo(int applyNo);

	public TableDto selectTable(int tableNo);

	public String selectTableIdByApplyNo(int applyNo);

	public TableDto selectApplyTable(int applyNo);

	public int insertTable(TableDto table);

	public int selectTableNo(@Param("schema")String schema,@Param("tableId") String tableId);

	public int insertApplyTableByTableNo(ApplyTableDto applyTable);

	public TableRewriteDto selectRewriteTable(int applyNo);



}
