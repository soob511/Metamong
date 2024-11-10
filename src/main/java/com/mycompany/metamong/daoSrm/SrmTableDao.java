package com.mycompany.metamong.daoSrm;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.column.ColumnDto;
import com.mycompany.metamong.dto.table.TableDto;

@Mapper
public interface SrmTableDao {
	
	public List<TableDto> selectTableName();

	public int CreateTable(String sql);

}
