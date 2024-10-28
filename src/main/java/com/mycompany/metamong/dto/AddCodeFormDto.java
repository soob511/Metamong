package com.mycompany.metamong.dto;

import java.util.List;

import lombok.Data;

@Data
public class AddCodeFormDto {
	private String codeNm;
	private String codeId;
	private String codeContent;
	private String applyReason;
	private List<AddItemDto> items;
}
