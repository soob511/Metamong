package com.mycompany.metamong.dto.notice;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeDto {
	private int rnum;
	private int noticeId;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeRegdate;
	private int noticeHitcount;
	private int noticeIsimp;
	private String noticeFilename;
	private String noticeFiletype;
	private byte[] noticeFiledata;
	public int deleteFile;
	
	public int prevNum;
	public int nextNum;
	private String prevTitle;
	private String nextTitle;
	}


