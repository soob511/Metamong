package com.mycompany.metamong.daoHr;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.table.TableDto;

@Mapper
public interface HrTableDao {
	
	public List<TableDto> selectTableName();

	public int CreateTable(String sql);

}
