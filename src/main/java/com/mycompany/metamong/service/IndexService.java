package com.mycompany.metamong.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoHr.Sub3IndexDao;
import com.mycompany.metamong.daoMain.IndexDao;
import com.mycompany.metamong.daoMain.TableDao;
import com.mycompany.metamong.daoPms.Sub2IndexDao;
import com.mycompany.metamong.daoSrm.Sub1IndexDao;
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
	private Sub1IndexDao sub1IndexDao;
	@Autowired
	private Sub2IndexDao sub2IndexDao;
	@Autowired
	private Sub3IndexDao sub3IndexDao;
	
	public List<IndexDto> getIndexList() {
		List<IndexDto> list = new ArrayList<>();
		list.addAll(sub1IndexDao.selectIndex());
		list.addAll(sub2IndexDao.selectIndex());
		list.addAll(sub3IndexDao.selectIndex());
		return list;
	}

	public List<IndexDto> getIndexList(String indexName, String columnName, String tableName, String schemaName) {
		List<IndexDto> list = new ArrayList<>();

		switch (schemaName) {
			case "MAIN":
				list.addAll(sub1IndexDao.selectIndexByDic(indexName, columnName, tableName));
	            for (IndexDto index : list) {
	                String indexTableName = index.getTableName();
	                TableDto tableDto = tableDao.selectTableInfo(indexTableName, schemaName);
	                if (tableDto != null) {
	                    index.setTableNo(tableDto.getTableNo());
	                }
	            }
	            list.addAll(sub2IndexDao.selectIndexByDic(indexName, columnName, tableName));
	            for (IndexDto index : list) {
	                String indexTableName = index.getTableName();
	                TableDto tableDto = tableDao.selectTableInfo(indexTableName, schemaName);
	                if (tableDto != null) {
	                    index.setTableNo(tableDto.getTableNo());
	                }
	            }
	            list.addAll(sub3IndexDao.selectIndexByDic(indexName, columnName, tableName));
	            for (IndexDto index : list) {
	                String indexTableName = index.getTableName();
	                TableDto tableDto = tableDao.selectTableInfo(indexTableName, schemaName);
	                if (tableDto != null) {
	                    index.setTableNo(tableDto.getTableNo());
	                }
	            }
	            break;
			case "SRM":
				list.addAll(sub1IndexDao.selectIndexByDic(indexName, columnName, tableName));
	            for (IndexDto index : list) {
	                String indexTableName = index.getTableName();
	                TableDto tableDto = tableDao.selectTableInfo(indexTableName, schemaName);
	                if (tableDto != null) {
	                    index.setTableNo(tableDto.getTableNo());
	                }
	            }
				break;
			case "PMS":
				list.addAll(sub2IndexDao.selectIndexByDic(indexName, columnName, tableName));
	            for (IndexDto index : list) {
	                String indexTableName = index.getTableName();
	                TableDto tableDto = tableDao.selectTableInfo(indexTableName, schemaName);
	                if (tableDto != null) {
	                    index.setTableNo(tableDto.getTableNo());
	                }
	            }
				break;
			case "HR":
				list.addAll(sub3IndexDao.selectIndexByDic(indexName, columnName, tableName));
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
				list.addAll(sub1IndexDao.selectIndexNoPk(indexName, columnName, tableName));
				break;
			case "PMS":
				list.addAll(sub2IndexDao.selectIndexNoPk(indexName, columnName, tableName));
				break;
			case "HR":
				list.addAll(sub3IndexDao.selectIndexNoPk(indexName, columnName, tableName));
				break;
			default:
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

	public void createIndex(IndexDto indexdto) {
		
	}
}
