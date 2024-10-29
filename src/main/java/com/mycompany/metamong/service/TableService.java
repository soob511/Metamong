package com.mycompany.metamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoMain.TableDao;
import com.mycompany.metamong.dto.TableDto;

@Service
public class TableService {
	
	@Autowired
	private TableDao tableDao;

	public List<TableDto> getTableList() {
		List<TableDto> list = tableDao.selectTableList();
		System.out.println(list);
		return list;
/*		return tableDao.selectTableList();*/
	}
	
	public List<TableDto> getTableName(String schemaName) {
		List<TableDto> list = tableDao.selectTableListBySchema(schemaName);
		return list;
	}
	
}
