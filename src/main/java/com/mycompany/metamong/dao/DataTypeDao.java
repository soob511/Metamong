package com.mycompany.metamong.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.dataType.DataTypeDto;

@Mapper
public interface DataTypeDao {

	public List<DataTypeDto> selectDataTypeList();

}
