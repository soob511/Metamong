package com.mycompany.metamong.dto;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeDto {
	private int noticeId;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeRegdate;
	private int noticeHitcount;
	private String noticeFilename;
	private String noticeFiletype;
	private byte[] noticeFiledata;
	
}
