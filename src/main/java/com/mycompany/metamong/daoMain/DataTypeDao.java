package com.mycompany.metamong.daoMain;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.dataType.DataTypeDto;

@Mapper
public interface DataTypeDao {

	public List<DataTypeDto> selectDataTypeList();

	public int insertDataType(DataTypeDto dataType);

	public int updateDataType(DataTypeDto dataType);

}
