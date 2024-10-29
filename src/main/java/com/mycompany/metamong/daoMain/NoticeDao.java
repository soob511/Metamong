package com.mycompany.metamong.daoMain;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.metamong.dto.Pager;
import com.mycompany.metamong.dto.notice.NoticeDto;

@Mapper
public interface NoticeDao {

	public int insertNotice(NoticeDto notice);
	
	public List<NoticeDto> selectList(Pager pager);
	
	public int countRows();
	
	public NoticeDto selectByNoticeId(int noticeId);
	
	public NoticeDto selectFileByNoticeId(int noticeId);
	
	public void updateHitcount(int noticeId);

	public int updateNotice(NoticeDto notice);

	public int deleteNotice(int noticeId);

	public NoticeDto selectPrevNoticeId(int noticeId);

	public NoticeDto selectNextNoticeId(int noticeId);

	public NoticeDto deleteFileById(int noticeId);
	
	public List<NoticeDto> selectNoticeSearch(@Param("keyword")String keyword, @Param("option") String option);

	
	}
