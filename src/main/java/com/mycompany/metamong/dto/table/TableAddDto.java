package com.mycompany.metamong.dto.table;

import java.util.List;

import com.mycompany.metamong.dto.column.ColumnAddDto;

import lombok.Data;

@Data
public class TableAddDto {
	private String schemaName;
	private int tableNo;
	private String tableNm;
	private String tableId;
	private String applyReason;
	private String tableContent;
	private List<ColumnAddDto> columns;
	private String applyType;
}
