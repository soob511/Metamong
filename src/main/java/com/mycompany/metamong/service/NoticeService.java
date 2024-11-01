package com.mycompany.metamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.dao.NoticeDao;
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

	public NoticeDto getNoticeDetail(int noticeId) {
		return noticeDao.selectNoticeDetail(noticeId);
	}

	public int addHitcount(int noticeId) {
		return noticeDao.updateHitcount(noticeId);
	}
		
	public NoticeDto getPrevNotice(int noticeId) {
		return noticeDao.selectPrevNotice(noticeId);
	}

	public NoticeDto getNextNotice(int noticeId) {
		return noticeDao.selectNextNotice(noticeId);
	}

	public NoticeDto getNoticeFile(int noticeId) {
		return noticeDao.selectNoticeFile(noticeId);
	}

	public int insertNotice(NoticeDto notice) {
		 return noticeDao.insertNotice(notice);
	}

	public int deleteNotice(int noticeId) {		
		 return noticeDao.deleteNotice(noticeId);
	}

	public int updateNotice(NoticeDto notice) {
		return noticeDao.updateNotice(notice);
	}
}