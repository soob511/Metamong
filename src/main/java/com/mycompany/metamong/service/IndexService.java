package com.mycompany.metamong.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoMain.IndexDao;
import com.mycompany.metamong.daoSub1.Sub1IndexDao;
import com.mycompany.metamong.daoSub2.Sub2IndexDao;
import com.mycompany.metamong.daoSub3.Sub3IndexDao;
import com.mycompany.metamong.dto.IndexDto;
import com.mycompany.metamong.enums.SchemaEnums;

@Service
public class IndexService {
	@Autowired
	private IndexDao indexDao;
	@Autowired
	private Sub1IndexDao sub1IndexDao;
	@Autowired
	private Sub2IndexDao sub2IndexDao;
	@Autowired
	private Sub3IndexDao sub3IndexDao;
	
	public List<IndexDto> getIndexList() {
		List<IndexDto> list = indexDao.selectIndex();
		list.addAll(sub1IndexDao.selectIndex());
		list.addAll(sub2IndexDao.selectIndex());
		list.addAll(sub3IndexDao.selectIndex());
		return list;
	}
	
	public List<IndexDto> getIndexList(SchemaEnums schemaName) {
		List<IndexDto> list = new ArrayList<>();
		
		switch (schemaName) {
			case MAIN:
				list = indexDao.selectIndex();
				break;
			case SUB1:
				list = sub1IndexDao.selectIndex();
				break;
			case SUB2:
				list = sub2IndexDao.selectIndex();
				break;
			case SUB3:
				list = sub3IndexDao.selectIndex();
				break;
			default:
				break;
		}
		return list;
	}
	
	public List<IndexDto> getIndexList(SchemaEnums schemaName, String indexName) {
		List<IndexDto> list = new ArrayList<>();
		
		switch (schemaName) {
			case MAIN:
				list = indexDao.selectIndexByName(indexName);
				break;
			case SUB1:
				list = sub1IndexDao.selectIndexByName(indexName);
				break;
			case SUB2:
				list = sub2IndexDao.selectIndexByName(indexName);
				break;
			case SUB3:
				list = sub3IndexDao.selectIndexByName(indexName);
				break;
			default:
				break;
		}
		return list;
	}
}
