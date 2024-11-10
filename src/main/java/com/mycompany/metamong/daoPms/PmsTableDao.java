package com.mycompany.metamong.daoPms;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.table.TableDto;

@Mapper
public interface PmsTableDao {
	
	public List<TableDto> selectTableName();

	public int CreateTable(String sql);

}
