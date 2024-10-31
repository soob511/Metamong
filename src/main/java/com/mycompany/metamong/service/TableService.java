package com.mycompany.metamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoMain.TableDao;
import com.mycompany.metamong.dto.table.ApplyTableDto;
import com.mycompany.metamong.dto.table.TableDto;

@Service
public class TableService {
	
	@Autowired
	private TableDao tableDao;

	public List<TableDto> getTableList() {
		return tableDao.selectTableList();
	}

	public List<TableDto> getTableSearch(String content, String schema) {
		return tableDao.selectTableSearch(content,schema);
	}

	public void addApplyTable(ApplyTableDto applyTable) {
		tableDao.insertApplyTable(applyTable);
	}
	
	public List<TableDto> getTableName(String schemaName) {
		return tableDao.selectTableListBySchema(schemaName);
	}
	

	public TableDto getTableByApplyNo(int applyNo) {
		return tableDao.selectTableByApplyNo(applyNo);
	}

	public TableDto getTable(int tableNo) {
		return tableDao.selectTable(tableNo);
	}

}
