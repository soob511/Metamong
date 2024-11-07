package com.mycompany.metamong.dto.sequence;

import lombok.Data;

@Data
public class SequenceDto {
	private String sequenceName;
	private String schemaName;
	private int minValue;
	private int maxValue;
	private int incrementBy;
	private int lastNumber;

}
