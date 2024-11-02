package com.mycompany.metamong.dto.item;

import lombok.Data;

@Data
public class ItemApplyDto {
	private String itemId;
	private String itemNm;
	private int itemIsActive;
	private String itemContent;
	private int itemIsUpdate;
}