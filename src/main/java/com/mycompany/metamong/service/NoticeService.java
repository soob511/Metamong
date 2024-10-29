package com.mycompany.metamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoMain.NoticeDao;
import com.mycompany.metamong.dto.Pager;
import com.mycompany.metamong.dto.notice.NoticeDto;

@Service
public class NoticeService {
	@Autowired 
	private NoticeDao noticeDao;
	

	public List<NoticeDto> getNoticeList(Pager pager) {
		return noticeDao.selectNoticeList(pager);	
	}
	
	public int getTotalRows() {
		return noticeDao.countRows();
	}
}
