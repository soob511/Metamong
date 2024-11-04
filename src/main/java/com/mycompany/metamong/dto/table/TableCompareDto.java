package com.mycompany.metamong.dto.table;

import java.util.List;

import com.mycompany.metamong.dto.column.NewColumnDto;

import lombok.Data;

@Data
public class TableCompareDto {
	private int tableNo;
	private List<NewColumnDto> columns;
	private String applyReason;
}
