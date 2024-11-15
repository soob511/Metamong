package com.mycompany.metamong.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoHr.HrTableDao;
import com.mycompany.metamong.daoMain.TableDao;
import com.mycompany.metamong.daoPms.PmsTableDao;
import com.mycompany.metamong.daoSrm.SrmTableDao;
import com.mycompany.metamong.dto.table.ApplyTableDto;
import com.mycompany.metamong.dto.table.TableDto;
import com.mycompany.metamong.dto.table.TableRewriteDto;
import com.mycompany.metamong.enums.SchemaEnum;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class TableService {
	
	@Autowired
	private TableDao tableDao;
	@Autowired
	private SrmTableDao srmTableDao;
	@Autowired
	private PmsTableDao pmsTableDao;
	@Autowired
	private HrTableDao hrTableDao;
	
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
	
	public List<TableDto> getTableNameByDic(String schemaName) {
		List<TableDto> list = new ArrayList<>();

		switch (schemaName) {
			case "ALL":
				list.addAll(srmTableDao.selectTableName());
				list.addAll(pmsTableDao.selectTableName());
				list.addAll(hrTableDao.selectTableName());
				break;
			case "SRM":
				list.addAll(srmTableDao.selectTableName());
				break;
			case "PMS":
				list.addAll(pmsTableDao.selectTableName());
				break;
			case "HR":
				list.addAll(hrTableDao.selectTableName());
				break;
			default:
				break;
		}
		return list;
	}
	
	public TableDto getTableInfo(String schemaName, String tableName) {
		return tableDao.selectTableInfo(tableName, schemaName);
	}
	
	public List<TableDto> getTableInfo(String schemaName) {
		List<TableDto> tableDic = new ArrayList<>();
		List<TableDto> newList = new ArrayList<>();

		switch (schemaName) {
			case "SRM":
				tableDic.addAll(srmTableDao.selectTableName());
				for (TableDto table : tableDic) {
			        String tableName = table.getTableNm();
			        TableDto newTableDto = tableDao.selectTableInfo(tableName, schemaName);
			        if (newTableDto != null) newList.add(newTableDto);
			    }
				break;
			case "PMS":
				tableDic.addAll(pmsTableDao.selectTableName());
				for (TableDto table : tableDic) {
			        String tableName = table.getTableNm();
			        TableDto newTableDto = tableDao.selectTableInfo(tableName, schemaName);
			        if (newTableDto != null) newList.add(newTableDto);
			    }
				break;
			case "HR":
				tableDic.addAll(hrTableDao.selectTableName());
				for (TableDto table : tableDic) {
			        String tableName = table.getTableNm();
			        TableDto newTableDto = tableDao.selectTableInfo(tableName, schemaName);
			        if (newTableDto != null) newList.add(newTableDto);
			    }
				break;
			default:
				break;
		}	
		return newList;
	}

	public TableRewriteDto getRewriteTable(int applyNo) {
		return tableDao.selectRewriteTable(applyNo);
	}

}
