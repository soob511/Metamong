package com.mycompany.metamong.dto.index;

import lombok.Data;

@Data
public class ApplyIndexDto {
	private int applyNo;
	private int tableNo;
	private String idxName;
	private int isUnique;
	private String refColumn;
}
