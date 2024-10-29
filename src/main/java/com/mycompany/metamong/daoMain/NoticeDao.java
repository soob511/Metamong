package com.mycompany.metamong.daoMain;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.notice.NoticeDto;

@Mapper
public interface NoticeDao {
	
	public List<NoticeDto> selectNoticeList();

}
