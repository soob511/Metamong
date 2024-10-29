package com.mycompany.metamong.dto;

import lombok.Data;

@Data
public class ColumnAddDto {

	private String colNm;
	private String colId;
	private String dataType;
	private String colLength;
	private String colNullable;
	private String colPk;
	
}
