package com.mycompany.metamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoMain.NoticeDao;
import com.mycompany.metamong.dto.NoticeDto;

@Service
public class NoticeService {
	@Autowired 
	private NoticeDao noticeDao;
	

	public List<NoticeDto> selectNoticeList() {
		return noticeDao.selectNoticeList();
		
	}

}
