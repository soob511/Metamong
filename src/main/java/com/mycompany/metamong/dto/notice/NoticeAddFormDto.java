package com.mycompany.metamong.dto.notice;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeAddFormDto {
	private String noticeTitle;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date noticeRegdate;
	private String noticeContent;
	private MultipartFile noticeFile;
}
