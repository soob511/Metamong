package com.mycompany.metamong.dto;

import lombok.Data;

@Data
public class ColumnDto {
	private int tableNo;
	private String colId;
	private String colNm;
	private String dataType;
	private String colLength;
	private int colIsnullable;
	private int colIspk;
	private int colOrder;
	

}
