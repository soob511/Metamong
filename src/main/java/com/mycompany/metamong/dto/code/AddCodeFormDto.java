package com.mycompany.metamong.dto.code;

import java.util.List;

import com.mycompany.metamong.dto.item.AddItemDto;

import lombok.Data;

@Data
public class AddCodeFormDto {
	private String codeNm;
	private String codeId;
	private String codeContent;
	private String applyReason;
	private List<AddItemDto> items;
}
