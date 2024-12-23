package com.mycompany.metamong.dto.code;

import java.util.List;

import com.mycompany.metamong.dto.item.ItemApplyDto;

import lombok.Data;

@Data
public class CodeApplyDto {
	private int codeNo;
	private String codeNm;
	private String codeId;
	private String codeLength;
	private String codeContent;
	private int codeIsActive;
	private String applyType;
	private String applyReason;
	private List<ItemApplyDto> items;
}
