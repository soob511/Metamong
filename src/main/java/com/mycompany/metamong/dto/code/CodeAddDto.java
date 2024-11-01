package com.mycompany.metamong.dto.code;

import java.util.List;

import com.mycompany.metamong.dto.item.ItemAddDto;

import lombok.Data;

@Data
public class CodeAddDto {
	private String codeNm;
	private String codeId;
	private String codeLength;
	private String codeContent;
	private String applyReason;
	private List<ItemAddDto> items;
}
