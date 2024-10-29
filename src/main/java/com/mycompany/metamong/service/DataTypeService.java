package com.mycompany.metamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoMain.DataTypeDao;
import com.mycompany.metamong.dto.column.DataTypeDto;

@Service
public class DataTypeService {
	
	@Autowired
	private DataTypeDao dataTypeDao;

	public List<DataTypeDto> getDataTypeList() {
		return dataTypeDao.selectDataTypeList();
	}

}
