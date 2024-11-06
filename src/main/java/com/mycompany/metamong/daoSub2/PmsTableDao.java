package com.mycompany.metamong.daoSub2;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.table.TableDto;

@Mapper
public interface PmsTableDao {
	
	public List<TableDto> selectTableByDic();

	public int CreateTable(String sql);

}
