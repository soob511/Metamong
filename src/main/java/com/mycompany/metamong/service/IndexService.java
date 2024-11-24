package com.mycompany.metamong.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoHr.HrIndexDao;
import com.mycompany.metamong.daoMain.IndexDao;
import com.mycompany.metamong.daoMain.TableDao;
import com.mycompany.metamong.daoPms.PmsIndexDao;
import com.mycompany.metamong.daoSrm.SrmIndexDao;
import com.mycompany.metamong.dto.index.IndexDto;
import com.mycompany.metamong.dto.table.TableDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class IndexService {
	@Autowired
	private IndexDao indexDao;
	@Autowired
	private TableDao tableDao;
	@Autowired
	private SrmIndexDao srmIndexDao;
	@Autowired
	private PmsIndexDao pmsIndexDao;
	@Autowired
	private HrIndexDao hrIndexDao;
	
	public List<IndexDto> getIndexList() {
		List<IndexDto> list = new ArrayList<>();
		list.addAll(srmIndexDao.selectIndex());
		list.addAll(pmsIndexDao.selectIndex());
		list.addAll(hrIndexDao.selectIndex());
		return list;
	}

	public List<IndexDto> getIndexList(String indexName, String columnName, String tableName, String schemaName) {
		List<IndexDto> list = new ArrayList<>();

		switch (schemaName) {
			case "MAIN":
				list.addAll(srmIndexDao.selectIndexByDic(indexName, columnName, tableName));
	            for (IndexDto index : list) {
	                String indexTableName = index.getTableName();
	                TableDto tableDto = tableDao.selectTableInfo(indexTableName, schemaName);
	                if (tableDto != null) {
	                    index.setTableNo(tableDto.getTableNo());
	                }
	            }
	            list.addAll(pmsIndexDao.selectIndexByDic(indexName, columnName, tableName));
	            for (IndexDto index : list) {
	                String indexTableName = index.getTableName();
	                TableDto tableDto = tableDao.selectTableInfo(indexTableName, schemaName);
	                if (tableDto != null) {
	                    index.setTableNo(tableDto.getTableNo());
	                }
	            }
	            list.addAll(hrIndexDao.selectIndexByDic(indexName, columnName, tableName));
	            for (IndexDto index : list) {
	                String indexTableName = index.getTableName();
	                TableDto tableDto = tableDao.selectTableInfo(indexTableName, schemaName);
	                if (tableDto != null) {
	                    index.setTableNo(tableDto.getTableNo());
	                }
	            }
	            break;
			case "SRM":
				list.addAll(srmIndexDao.selectIndexByDic(indexName, columnName, tableName));
	            for (IndexDto index : list) {
	                String indexTableName = index.getTableName();
	                TableDto tableDto = tableDao.selectTableInfo(indexTableName, schemaName);
	                if (tableDto != null) {
	                    index.setTableNo(tableDto.getTableNo());
	                }
	            }
				break;
			case "PMS":
				list.addAll(pmsIndexDao.selectIndexByDic(indexName, columnName, tableName));
	            for (IndexDto index : list) {
	                String indexTableName = index.getTableName();
	                TableDto tableDto = tableDao.selectTableInfo(indexTableName, schemaName);
	                if (tableDto != null) {
	                    index.setTableNo(tableDto.getTableNo());
	                }
	            }
				break;
			case "HR":
				list.addAll(hrIndexDao.selectIndexByDic(indexName, columnName, tableName));
	            for (IndexDto index : list) {
	                String indexTableName = index.getTableName();
	                TableDto tableDto = tableDao.selectTableInfo(indexTableName, schemaName);
	                if (tableDto != null) {
	                    index.setTableNo(tableDto.getTableNo());
	                }
	            }
				break;
			default:
				break;
			}
		return list;
	}
	
	public List<IndexDto> getIndexListNoPk(String indexName, String columnName, String tableName, String schemaName) {
		List<IndexDto> list = new ArrayList<>();

		switch (schemaName) {
			case "SRM":
				list.addAll(srmIndexDao.selectIndexNoPk(indexName, columnName, tableName));
				break;
			case "PMS":
				list.addAll(pmsIndexDao.selectIndexNoPk(indexName, columnName, tableName));
				break;
			case "HR":
				list.addAll(hrIndexDao.selectIndexNoPk(indexName, columnName, tableName));
				break;
			}
		return list;
	}
	
	public int countTotalRows() {
		return indexDao.selectTotalRows();
	}
	
	public int countIndexRows(String schemaName, int approvalStatus, String indexName) {
		return indexDao.selectIndexRows(schemaName, approvalStatus, indexName);
	}
	
	public int countRowsByApplyMId(String schemaName, int approvalStatus, String mName) {
		return indexDao.selectRowsByMId(schemaName, approvalStatus, mName);
	}

	public IndexDto checkDuplicateIndexName(String schemaName, String indexName) {
		IndexDto index = new IndexDto();
		/*
		index = indexDao.selectDuplicateIndex(schemaName, indexName);
		if (index != null) return index;
		*/ 
		switch (schemaName) {
			case "SRM":
				index = srmIndexDao.selectDuplicateIndex(indexName);
				break;
			case "PMS":
				index = pmsIndexDao.selectDuplicateIndex(indexName);
				break;
			case "HR":
				index = hrIndexDao.selectDuplicateIndex(indexName);
				break;
			}
		return index;
	}
}
