package com.mycompany.metamong.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ApplyListDto {
	private int applyNo;
	private String mId;
	private Date applyDate;
	private Date complDate;
	private String dbaName;
	private String applyReason;
	private String rejectReason;
	private int approvalStatus;
	private String query;
	private String schemaName;
	private String applyObj;
	private String applyType;
}
