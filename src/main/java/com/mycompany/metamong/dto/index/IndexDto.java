package com.mycompany.metamong.dto.index;

import lombok.Data;

@Data
public class IndexDto {
	private int tableNo;
	private String indexName;
	private String schemaName;
	private String tableName;
	private String columnName;
	private String columnPosition;
	private String uniqueness;
	private String descend;
	private String pkStatus;
}
