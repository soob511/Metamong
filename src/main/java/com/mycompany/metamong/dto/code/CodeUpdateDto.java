package com.mycompany.metamong.dto.code;

import java.util.List;

import com.mycompany.metamong.dto.item.ItemUpdateDto;

import lombok.Data;

@Data
public class CodeUpdateDto {
	private int codeNo;
	private String codeNm;
	private String codeId;
	private int codeLength;
	private String codeContent;
	private int codeIsActive;
	private String applyReason;
	private List<ItemUpdateDto> items;
}
