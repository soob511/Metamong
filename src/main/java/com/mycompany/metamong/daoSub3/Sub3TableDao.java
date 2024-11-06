package com.mycompany.metamong.daoSub3;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.table.TableDto;

@Mapper
public interface Sub3TableDao {
	
	public List<TableDto> selectTableByDic();

	public void CreateTable(String sql);

}
