package com.mycompany.metamong.daoMain;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.ColumnDto;

@Mapper
public interface ColumnDao {

	public List<ColumnDto> selectColumnList(int tableId);

}
