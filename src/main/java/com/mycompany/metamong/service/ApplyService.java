package com.mycompany.metamong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoMain.ApplyDao;
import com.mycompany.metamong.dto.ApplyDto;

@Service
public class ApplyService {
	@Autowired
	private ApplyDao applyDao;

	public void addApply(ApplyDto apply) {
		applyDao.insertApply(apply);	
	}
}
