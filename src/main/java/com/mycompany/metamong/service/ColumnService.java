package com.mycompany.metamong.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoHr.HrColumnDao;
import com.mycompany.metamong.daoMain.ColumnDao;
import com.mycompany.metamong.daoPms.PmsColumnDao;
import com.mycompany.metamong.daoSrm.SrmColumnDao;
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
	private SrmColumnDao srmColumnDao;
	@Autowired
	private PmsColumnDao pmsColumnDao;
	@Autowired
	private HrColumnDao hrColumnDao;
	
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
				list.addAll(srmColumnDao.selectColumnName(tableName));
				list.addAll(pmsColumnDao.selectColumnName(tableName));
				list.addAll(hrColumnDao.selectColumnName(tableName));
			case "SRM":
				list.addAll(srmColumnDao.selectColumnName(tableName));
				break;
			case "PMS":
				list.addAll(pmsColumnDao.selectColumnName(tableName));
				break;
			case "HR":
				list.addAll(hrColumnDao.selectColumnName(tableName));
				break;
			default:
				break;
		}
		return list;
	}
	
	public List<ColumnDto> getColumnInfo(String schemaName, int tableNo, String tableName) {
		List<ColumnDto> list = new ArrayList<>();

		switch (schemaName) {
			case "SRM":
				list.addAll(srmColumnDao.selectColumnInfo(tableName));
				for (ColumnDto col : list) {
			        String colId = col.getColId();
			        String colNm = columnDao.selectColumnName(tableNo, colId);
			        if (colNm != null) col.setColNm(colNm);
			    }
				break;
			case "PMS":
				list.addAll(pmsColumnDao.selectColumnInfo(tableName));
				for (ColumnDto col : list) {
			        String colId = col.getColId();
			        String colNm = columnDao.selectColumnName(tableNo, colId);
			        if (colNm != null) col.setColNm(colNm);
			    }
				break;
			case "HR":
				list.addAll(hrColumnDao.selectColumnInfo(tableName));
				for (ColumnDto col : list) {
			        String colId = col.getColId();
			        String colNm = columnDao.selectColumnName(tableNo, colId);
			        if (colNm != null) col.setColNm(colNm);
			    }
				break;
			default:
				break;
		}
		return list;
	}

}
