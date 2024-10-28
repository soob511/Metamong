package com.mycompany.metamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoMain.ColumnDao;
import com.mycompany.metamong.dto.ColumnDto;

@Service
public class ColumnService {
	
	@Autowired
	private ColumnDao columnDao;

	public List<ColumnDto> getColumnList(int tableId) {
		return columnDao.selectColumnList(tableId);
	}

}
