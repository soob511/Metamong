package com.mycompany.metamong.dto.sequence;

import java.math.BigDecimal;

import lombok.Data;

@Data
public class SequenceDto {
	private String sequenceName;
	private String schemaName;
	private int minValue;
	private BigDecimal maxValue;
	private int incrementBy;
	private int lastNumber;

}
