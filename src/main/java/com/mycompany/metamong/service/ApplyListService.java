package com.mycompany.metamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoMain.ApplyListDao;
import com.mycompany.metamong.dto.applyList.ApplyListDto;
import com.mycompany.metamong.dto.table.ApplyTableDto;

@Service
public class ApplyListService {
	@Autowired
	private ApplyListDao applyDao;

	public void addApplyList(ApplyListDto apply) {
		applyDao.insertApplyList(apply);	
	}

	public List<ApplyTableDto> getApplyTableList() {
		return applyDao.selectApplyTableList();
	}
}
