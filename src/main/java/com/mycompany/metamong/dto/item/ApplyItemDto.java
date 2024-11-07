package com.mycompany.metamong.dto.item;

import lombok.Data;

@Data
public class ApplyItemDto {
	private int applyNo;
	private String itemId;
	private String itemNm;
	private String itemContent;
	private int itemIsActive;
	private int itemIsUpdate;
	private int codeNo;
}
