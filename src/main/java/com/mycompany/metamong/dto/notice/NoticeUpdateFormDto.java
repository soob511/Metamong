package com.mycompany.metamong.dto.notice;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeUpdateFormDto {
	public int noticeId;
	private String noticeTitle;
	private int noticeIsimp;
	private String noticeContent;
	private String noticeFilename;
	private String noticeFiletype;
	private byte[] noticeFiledata;
	private MultipartFile noticeFile;
	public int deleteFile;
	private String MId;
}
