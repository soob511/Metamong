package com.mycompany.metamong.dto.item;

import lombok.Data;

@Data
public class ItemDto {
	private int codeNo;
	private String itemId;
	private String itemNm;
	private String itemContent;
	private int itemIsActive;
}
