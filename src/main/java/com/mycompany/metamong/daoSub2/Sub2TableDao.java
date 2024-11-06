package com.mycompany.metamong.daoSub2;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.table.TableDto;

@Mapper
public interface Sub2TableDao {
	
	public List<TableDto> selectTableName();

	public void CreateTable(String sql);

}
