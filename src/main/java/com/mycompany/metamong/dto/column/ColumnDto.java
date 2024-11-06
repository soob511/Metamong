package com.mycompany.metamong.dto.column;

import lombok.Data;

@Data
public class ColumnDto {
	private int tableNo;
	private String colId;
	private String colNm;
	private String dataType;
	private String colLength;
	private int colIsnullable;
	private String colIsnullableText;
	private int colIspk;
	private String colIspkText;
	private int colOrder;

}
