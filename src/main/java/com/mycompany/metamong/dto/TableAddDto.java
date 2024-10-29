package com.mycompany.metamong.dto;

import java.util.List;

import lombok.Data;

@Data
public class TableAddDto {
	
	private String tableNm;
	private String tableId;
	private String applyReason;
	private String tableContent;
	private List<ColumnAddDto> columns;

}
