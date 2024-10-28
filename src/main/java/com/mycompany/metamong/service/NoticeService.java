package com.mycompany.metamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
		// 빈 번호가 있는지 확인하여 noticeId 설정
        Integer availableId = noticeDao.selectMinAvailableId();
        notice.setNoticeId(availableId != null ? availableId : (noticeDao.selectMaxNoticeId() + 1)); // 빈 번호가 없으면 최대값 + 1 사용

		
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

	public NoticeDto getPrevNotice(int noticeId) {
		return noticeDao.selectPrevNoticeId(noticeId);
		
		
	}

	public NoticeDto getNextNotice(int noticeId) {
		return noticeDao.selectNextNoticeId(noticeId);
	
		
	}

	public void updateNotice(NoticeDto notice, MultipartFile noticeFile, boolean deleteFile) throws Exception{
	    // 기존 파일 삭제 여부 확인
	    if (deleteFile) {
	        noticeDao.deleteFileById(notice.getNoticeId()); // 기존 파일 삭제 메서드 호출
	    }
	    
	    // 새 파일이 업로드된 경우 파일 저장 처리
	    if (!noticeFile.isEmpty()) {
	        // 파일 저장 로직 추가
	        notice.setNoticeFilename(noticeFile.getOriginalFilename());
	        notice.setNoticeFiledata(noticeFile.getBytes());
	        notice.setNoticeFiletype(noticeFile.getContentType());
	    }
	    
	    noticeDao.updateNotice(notice);
	}
 	public List<NoticeDto> searchNoticesByTitle(String keyword) {
	        return noticeDao.findNoticesByTitle(keyword);
	    }
 	
 }
	
