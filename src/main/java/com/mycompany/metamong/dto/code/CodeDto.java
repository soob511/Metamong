package com.mycompany.metamong.dto.code;

import lombok.Data;

@Data
public class CodeDto {
	private int codeNo;
	private String codeNm;
	private String codeId;
	private String codeContent;
	private int codeIsActive;
}