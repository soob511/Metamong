package com.mycompany.metamong.dto;

import lombok.Data;

@Data
public class ApplyCodeDto {
	private int applyNo;
	private int codeNo;
	private String codeNm;
	private String codeId;
	private String codeContent;
	private int codeIsActive;
}