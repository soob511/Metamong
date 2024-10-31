package com.mycompany.metamong.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoMain.ColumnDao;
import com.mycompany.metamong.dto.column.ApplyColumnDto;
import com.mycompany.metamong.dto.column.ColumnDto;
import com.mycompany.metamong.enums.SchemaEnum;

@Service
public class ColumnService {
	
	@Autowired
	private ColumnDao columnDao;

	public List<ColumnDto> getColumnList(int tableId) {
		return columnDao.selectColumnList(tableId);
	}
	
	public List<ColumnDto> getColumnList(SchemaEnum schemaName, int tableNo) {
		return columnDao.selectColumnByTable(schemaName, tableNo);
	}

	public void addApplyColumn(ApplyColumnDto applyColumn) {
		columnDao.insertApplyColumn(applyColumn);	
	}

}
