package com.mycompany.metamong.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoMain.TableDao;
import com.mycompany.metamong.daoSub1.SrmTableDao;
import com.mycompany.metamong.daoSub2.PmsTableDao;
import com.mycompany.metamong.daoSub3.HrTableDao;
import com.mycompany.metamong.dto.table.ApplyTableDto;
import com.mycompany.metamong.dto.table.TableDto;
import com.mycompany.metamong.enums.SchemaEnum;

@Service
public class TableService {
	
	@Autowired
	private TableDao tableDao;
	@Autowired
	private SrmTableDao sub1TableDao;
	@Autowired
	private PmsTableDao sub2TableDao;
	@Autowired
	private HrTableDao sub3TableDao;
	
	public List<TableDto> getTableList() {
		return tableDao.selectTableList();
	}

	public List<TableDto> getTableSearch(String content, String schema) {
		return tableDao.selectTableSearch(content,schema);
	}

	public void addApplyTable(ApplyTableDto applyTable) {
		tableDao.insertApplyTable(applyTable);
	}
	
	public List<TableDto> getTableName(SchemaEnum schemaName) {
		return tableDao.selectTableListBySchema(schemaName);
	}
	

	public TableDto getTableByApplyNo(int applyNo) {
		return tableDao.selectTableByApplyNo(applyNo);
	}

	public TableDto getTable(int tableNo) {
		return tableDao.selectTable(tableNo);
	}
	
	public List<TableDto> getTableListByDic(String schemaName) {
		List<TableDto> list = new ArrayList<>();

		switch (schemaName) {
			case "ALL":
				list.addAll(sub1TableDao.selectTableByDic());
				list.addAll(sub2TableDao.selectTableByDic());
				list.addAll(sub3TableDao.selectTableByDic());
			case "SPM":
				list.addAll(sub1TableDao.selectTableByDic());
				break;
			case "PMS":
				list.addAll(sub2TableDao.selectTableByDic());
				break;
			case "HR":
				list.addAll(sub3TableDao.selectTableByDic());
				break;
			default:
				break;
		}
		return list;
	}

}
