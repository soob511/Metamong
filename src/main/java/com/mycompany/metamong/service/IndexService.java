package com.mycompany.metamong.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoSub1.Sub1IndexDao;
import com.mycompany.metamong.daoSub2.Sub2IndexDao;
import com.mycompany.metamong.daoSub3.Sub3IndexDao;
import com.mycompany.metamong.dto.index.IndexDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class IndexService {
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
				list.addAll(sub2IndexDao.selectIndexByDic(indexName, columnName, tableName));
				list.addAll(sub3IndexDao.selectIndexByDic(indexName, columnName, tableName));
				break;
			case "SPM":
				list.addAll(sub1IndexDao.selectIndexByDic(indexName, columnName, tableName));
				break;
			case "PMS":
				list.addAll(sub2IndexDao.selectIndexByDic(indexName, columnName, tableName));
				break;
			case "HR":
				list.addAll(sub3IndexDao.selectIndexByDic(indexName, columnName, tableName));
				break;
			default:
				break;
			}
		return list;
	}

	public void createIndex(IndexDto indexdto) {
		
	}
}
