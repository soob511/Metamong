package com.mycompany.metamong.daoMain;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.metamong.dto.Pager;
import com.mycompany.metamong.dto.notice.NoticeDto;
import com.mycompany.metamong.dto.notice.NoticeUpdateFormDto;

@Mapper
public interface NoticeDao {
	
	public List<NoticeDto> selectNoticeList(Pager pager);

	public int countRows();

	public NoticeDto selectNoticeDetail(int noticeId);

	public int updateHitcount(int noticeId);

	public NoticeDto selectNoticeFile(int noticeId);

	public NoticeDto selectPrevNext(int noticeId);
	
	public int insertNotice(NoticeDto notice);

	public int deleteNotice(int noticeId);

	public int updateNotice(NoticeDto notice);

	public int deleteFile(NoticeUpdateFormDto form);
	
	public List<NoticeDto> selectNoticeSearch(@Param("option")String option, @Param("keyword")String keyword, @Param("pager")Pager pager);

	public int countNotices(@Param("option") String option, @Param("keyword") String keyword, @Param("pageNo") int pageNo);
}