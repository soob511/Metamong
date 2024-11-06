package com.mycompany.metamong.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoMain.ColumnDao;
import com.mycompany.metamong.daoSub1.Sub1ColumnDao;
import com.mycompany.metamong.daoSub2.Sub2ColumnDao;
import com.mycompany.metamong.daoSub3.Sub3ColumnDao;
import com.mycompany.metamong.dto.column.ApplyColumnDto;
import com.mycompany.metamong.dto.column.ColumnDto;
import com.mycompany.metamong.dto.table.TableDto;
import com.mycompany.metamong.enums.SchemaEnum;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ColumnService {
	
	@Autowired
	private ColumnDao columnDao;
	@Autowired
	private Sub1ColumnDao sub1ColumnDao;
	@Autowired
	private Sub2ColumnDao sub2ColumnDao;
	@Autowired
	private Sub3ColumnDao sub3ColumnDao;
	
	public List<ColumnDto> getColumnList(int tableId) {
		return columnDao.selectColumnList(tableId);
	}
	
	public List<ColumnDto> getColumnList(SchemaEnum schemaName, int tableNo) {
		return columnDao.selectColumnByTable(schemaName, tableNo);
	}

	public void addApplyColumn(ApplyColumnDto applyColumn) {
		columnDao.insertApplyColumn(applyColumn);	
	}

	public List<ColumnDto> getColumnByApplyNo(int applyNo) {
		return columnDao.selectColumnByApplyNo(applyNo);
	}
	
	public List<ColumnDto> getColumnNameByDic(String schemaName, String tableName) {
		List<ColumnDto> list = new ArrayList<>();

		switch (schemaName) {
			case "ALL":
				list.addAll(sub1ColumnDao.selectColumnName(tableName));
				list.addAll(sub2ColumnDao.selectColumnName(tableName));
				list.addAll(sub3ColumnDao.selectColumnName(tableName));
			case "SPM":
				list.addAll(sub1ColumnDao.selectColumnName(tableName));
				break;
			case "PMS":
				list.addAll(sub2ColumnDao.selectColumnName(tableName));
				break;
			case "HR":
				list.addAll(sub3ColumnDao.selectColumnName(tableName));
				break;
			default:
				break;
		}
		return list;
	}
	
	public List<ColumnDto> getColumnInfo(String schemaName, int tableNo, String tableName) {
		List<ColumnDto> list = new ArrayList<>();

		switch (schemaName) {
			case "SPM":
				list.addAll(sub1ColumnDao.selectColumnInfo(tableName));
				for (ColumnDto col : list) {
			        String colId = col.getColId();
			        String colNm = columnDao.selectColumnName(tableNo, colId);
			        log.info("실행" + colId + colNm);
			        if (colNm != null) col.setColNm(colNm);
			        log.info("실행" + list);
			    }
				break;
			case "PMS":
				list.addAll(sub2ColumnDao.selectColumnInfo(tableName));
				for (ColumnDto col : list) {
			        String colId = col.getColId();
			        String colNm = columnDao.selectColumnName(tableNo, colId);
			        log.info("실행" + colId + colNm);
			        if (colNm != null) col.setColNm(colNm);
			        log.info("실행" + list);
			    }
				break;
			case "HR":
				list.addAll(sub3ColumnDao.selectColumnInfo(tableName));
				for (ColumnDto col : list) {
			        String colId = col.getColId();
			        String colNm = columnDao.selectColumnName(tableNo, colId);
			        log.info("실행" + colId + colNm);
			        if (colNm != null) col.setColNm(colNm);
			        log.info("실행" + list);
			    }
				break;
			default:
				break;
		}
		return list;
	}

}
