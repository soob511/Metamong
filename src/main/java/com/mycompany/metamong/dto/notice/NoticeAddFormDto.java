package com.mycompany.metamong.dto.notice;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeAddFormDto {
	private String noticeTitle;
	private String noticeContent;
	private int noticeIsimp;
	private MultipartFile noticeFile;
}
