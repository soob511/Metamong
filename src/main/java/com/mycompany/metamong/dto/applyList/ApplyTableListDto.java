package com.mycompany.metamong.dto.applyList;

import java.util.Date;

import lombok.Data;

@Data
public class ApplyTableListDto {

	private int applyNo;
	private String MName;
	private Date applyDate;
	private int approvalStatus;
	private String schemaName;
	private String tableId;
	private String applyObj;
	
}
