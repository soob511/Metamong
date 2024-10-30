package com.mycompany.metamong.daoMain;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.Pager;
import com.mycompany.metamong.dto.notice.NoticeDto;

@Mapper
public interface NoticeDao {
	
	public List<NoticeDto> selectNoticeList(Pager pager);

	public int countRows();

	public NoticeDto selectNoticeDetail(int noticeId);

	public int updateHitcount(int noticeId);

	public NoticeDto selectPrevNotice(int noticeId);

	public NoticeDto selectNextNotice(int noticeId);

	public NoticeDto selectNoticeFile(int noticeId);

	public int insertNotice(NoticeDto notice);
}