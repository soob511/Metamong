package com.mycompany.metamong.dto.table;

import java.util.List;

import com.mycompany.metamong.dto.column.ColumnDto;

import lombok.Data;

@Data
public class TableCompareDto {
	private int tableNo;
	private List<ColumnDto> columns;
	private String applyReason;
}
