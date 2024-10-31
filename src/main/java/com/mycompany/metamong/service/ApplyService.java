package com.mycompany.metamong.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mycompany.metamong.dto.applyList.ApplyListDto;
import com.mycompany.metamong.dto.index.ApplyIndexDto;

@Service
public class ApplyService {
	@Autowired
	private ApplyListService applyListService;
	@Autowired
	private IndexService indexService;
	
	@Transactional
	public void addApplyIndex(ApplyListDto applyListDto, ApplyIndexDto applyIndexDto) {
		applyListService.addApplyList(applyListDto);
		applyIndexDto.setApplyNo(applyListDto.getApplyNo());
		indexService.addApplyIndex(applyIndexDto);
	}
	
}
