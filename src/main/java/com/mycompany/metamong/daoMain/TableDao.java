package com.mycompany.metamong.daoMain;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.metamong.dto.ApplyTableDto;
import com.mycompany.metamong.dto.TableDto;

@Mapper
public interface TableDao {

	public List<TableDto> selectTableList();

	public List<TableDto> selectTableSearch(@Param(value = "content") String content,@Param(value = "schema") String schema);

	public int insertApplyTable(ApplyTableDto applyTable);



}
