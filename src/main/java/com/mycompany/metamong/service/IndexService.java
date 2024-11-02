package com.mycompany.metamong.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.metamong.daoMain.IndexDao;
import com.mycompany.metamong.daoSub1.Sub1IndexDao;
import com.mycompany.metamong.daoSub2.Sub2IndexDao;
import com.mycompany.metamong.daoSub3.Sub3IndexDao;
import com.mycompany.metamong.dto.applyList.ApplyListDto;
import com.mycompany.metamong.dto.index.ApplyIndexDto;
import com.mycompany.metamong.dto.index.ApplyIndexListDto;
import com.mycompany.metamong.dto.index.IndexDto;
import com.mycompany.metamong.enums.SchemaEnum;

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
		List<IndexDto> list = new ArrayList<>();
		list.addAll(indexDao.selectIndex());
		list.addAll(sub1IndexDao.selectIndex());
		list.addAll(sub2IndexDao.selectIndex());
		list.addAll(sub3IndexDao.selectIndex());
		return list;
	}
	
	public List<IndexDto> getIndexList(String indexName) {
		List<IndexDto> list = new ArrayList<>();
		list.addAll(indexDao.selectIndexByName(indexName));
		list.addAll(sub1IndexDao.selectIndexByName(indexName));
		list.addAll(sub2IndexDao.selectIndexByName(indexName));
		list.addAll(sub3IndexDao.selectIndexByName(indexName));
		return list;
	}

	public List<IndexDto> getIndexList(SchemaEnum schemaName) {
		List<IndexDto> list = new ArrayList<>();

		switch (schemaName) {
		case MAIN:
			list = indexDao.selectIndex();
			break;
		case SPM:
			list = sub1IndexDao.selectIndex();
			break;
		case PMS:
			list = sub2IndexDao.selectIndex();
			break;
		case HR:
			list = sub3IndexDao.selectIndex();
			break;
		default:
			break;
		}
		return list;
	}

	public List<IndexDto> getIndexList(SchemaEnum schemaName, String indexName) {
		List<IndexDto> list = new ArrayList<>();

		switch (schemaName) {
		case MAIN:
			list = indexDao.selectIndexByName(indexName);
			break;
		case SPM:
			list = sub1IndexDao.selectIndexByName(indexName);
			break;
		case PMS:
			list = sub2IndexDao.selectIndexByName(indexName);
			break;
		case HR:
			list = sub3IndexDao.selectIndexByName(indexName);
			break;
		default:
			break;
		}
		return list;
	}
	
	public List<ApplyIndexListDto> getApplyIndexList() {
		return indexDao.selectApplyIndex();
	}

	public void createIndex(IndexDto indexdto) {
		
	}
}
