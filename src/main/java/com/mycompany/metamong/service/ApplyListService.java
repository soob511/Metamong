package com.mycompany.metamong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoMain.ApplyListDao;
import com.mycompany.metamong.dto.applyList.ApplyListDto;

@Service
public class ApplyListService {
	@Autowired
	private ApplyListDao applyDao;

	public void addApplyList(ApplyListDto apply) {
		applyDao.insertApplyList(apply);	
	}
}
