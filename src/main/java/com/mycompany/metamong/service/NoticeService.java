package com.mycompany.metamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.dao.NoticeDao;
import com.mycompany.metamong.dto.NoticeDto;
import com.mycompany.metamong.dto.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j

public class NoticeService {
	@Autowired
	private NoticeDao noticeDao;
	
	public List<NoticeDto> getNoticeList(Pager pager) {
		List<NoticeDto> list = noticeDao.selectList(pager);
		return list;
	}
	public NoticeDto getNotice(int noticeId) {
		NoticeDto notice = noticeDao.selectByNoticeId(noticeId);
		return notice;
	}
	public void addNotice(NoticeDto notice) {
		 noticeDao.addNotice(notice);
		int noticeId = notice.getNoticeId();
	}
	public int getTotalRows() {
		int totalRows = noticeDao.countRows();
		return totalRows;
	}
	public NoticeDto getNoticeFile(int noticeId) {
		NoticeDto notice = noticeDao.selectFileByNoticeId(noticeId);
		return notice;
		
	}
	public void addHitcount(int noticeId) {
		noticeDao.updateHitcount(noticeId);	
	}
}	
