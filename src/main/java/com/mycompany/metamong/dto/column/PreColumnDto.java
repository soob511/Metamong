package com.mycompany.metamong.dto.column;

import java.util.List;

import lombok.Data;

@Data
public class PreColumnDto {
	private List<ColumnDto> column;
	private int isChange;
}
