package com.mycompany.metamong.daoSub1;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.table.TableDto;

@Mapper
public interface Sub1TableDao {
	
	public List<TableDto> selectTableName();

	public void CreateTable(String sql);

}
