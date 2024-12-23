package com.mycompany.metamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoMain.NoticeDao;
import com.mycompany.metamong.dto.Pager;
import com.mycompany.metamong.dto.notice.NoticeDto;
import com.mycompany.metamong.dto.notice.NoticeUpdateFormDto;

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

	public NoticeDto getPrevNext(int noticeId) {
		return noticeDao.selectPrevNext(noticeId);
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
	
	public int deleteFile(NoticeUpdateFormDto form) {
		return noticeDao.deleteFile(form);
	}

	public List<NoticeDto> searchNotice(String option, String keyword, Pager pager) {
		return noticeDao.selectNoticeSearch(option, keyword, pager);
	}

	public int countNotices(String option, String keyword,int pageNo) {
		return noticeDao.countNotices(option,keyword,pageNo);
	}
}