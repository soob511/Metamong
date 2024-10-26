package com.mycompany.metamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoMain.NoticeDao;
import com.mycompany.metamong.daoSub1.Sub1TableDao;
import com.mycompany.metamong.dto.NoticeDto;
import com.mycompany.metamong.dto.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j

public class NoticeService {
	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private Sub1TableDao tableDao;
	
	public List<NoticeDto> getNoticeList(Pager pager) {
		List<NoticeDto> list = noticeDao.selectList(pager);
		return list;
	}
	
	public NoticeDto getNotice(int noticeId) {
		NoticeDto notice = noticeDao.selectByNoticeId(noticeId);
		return notice;
	}
	
	public int getTotalRows() {
		int totalRows = noticeDao.countRows();
		return totalRows;
	}
	
	public NoticeDto getNoticeFile(int noticeId) {
		NoticeDto notice = noticeDao.selectFileByNoticeId(noticeId);
		return notice;
		
	}
	
	public void insertNotice(NoticeDto notice) {
		 noticeDao.insertNotice(notice);
		
	}
	
	public void addHitcount(int noticeId) {
		noticeDao.updateHitcount(noticeId);	
	}
	
	public void updateNotice(NoticeDto notice) {
		noticeDao.updateNotice(notice);
	}

	public void deleteNotice(int noticeId) {
		noticeDao.deleteNotice(noticeId);
		
	}

	public List<NoticeDto> getSubList(int noticeId) {
		List<NoticeDto> subList = noticeDao.selectSubList(noticeId);
		return subList;
		
	}
	
}	
