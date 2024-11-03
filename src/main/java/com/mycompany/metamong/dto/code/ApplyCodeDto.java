package com.mycompany.metamong.dto.code;

import lombok.Data;

@Data
public class ApplyCodeDto {
	private int applyNo;
	private int codeNo;
	private String codeId;
	private String codeNm;
	private String codeLength;
	private String codeContent;
	private int codeIsActive;
}
