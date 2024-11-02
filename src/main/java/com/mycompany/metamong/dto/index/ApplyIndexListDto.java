package com.mycompany.metamong.dto.index;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ApplyIndexListDto {
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date applyDate;
	private String MId;
	private String schemaName;
	private String idxName;
	private String applyObj;
	private int approvalStatus;
}
