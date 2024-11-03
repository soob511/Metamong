package com.mycompany.metamong.service;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoMain.ApplyListDao;
import com.mycompany.metamong.daoMain.IndexDao;
import com.mycompany.metamong.dto.applyList.ApplyListDto;
import com.mycompany.metamong.dto.applyList.ApplyTableDeatilDto;
import com.mycompany.metamong.dto.index.ApplyIndexDto;
import com.mycompany.metamong.dto.index.ApplyIndexListDto;
import com.mycompany.metamong.dto.table.ApplyTableDto;

@Service
public class ApplyService {
	@Autowired
	private ApplyListDao applyListDao;
	@Autowired
	private IndexDao indexDao;

	public void addApplyList(ApplyListDto apply) {
		applyListDao.insertApplyList(apply);	
	}

	public List<ApplyTableDto> getApplyTableList() {
		return applyListDao.selectApplyTableList();
	}

	public List<ApplyTableDto> getApplyTableSearch(Map<String, String> form) {
		return applyListDao.selectApplyTableSearch(form);
	}

	public ApplyTableDeatilDto getTableListDetail(int applyNo) {
		return applyListDao.selectTableListDetail(applyNo);
	}
	
	@Transactional
	public void addApplyIndex(ApplyListDto applyListDto, ApplyIndexDto applyIndexDto) {
		applyListDao.insertApplyList(applyListDto);
		applyIndexDto.setApplyNo(applyListDto.getApplyNo());
		indexDao.insertApplyIndex(applyIndexDto);
	}
	
	public List<ApplyIndexListDto> getApplyIndexList() {
		return applyListDao.selectApplyIndex();
	}
	
	public List<ApplyIndexListDto> getApplyIndexList(
			String schemaName, 
			int approvalStatus, 
			String indexName) {
		return applyListDao.selectApplyIndexByParams(schemaName, approvalStatus, indexName);
	}

}
