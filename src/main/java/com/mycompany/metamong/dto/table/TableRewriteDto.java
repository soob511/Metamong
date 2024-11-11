package com.mycompany.metamong.dto.table;

import lombok.Data;

@Data
public class TableRewriteDto {
	private String schemaName;
	private String applyReason;
	private int tableNo;
	private String tableNm;
	private String tableId;
	private String tableContent;

}
