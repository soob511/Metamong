package com.mycompany.metamong.dto.applyList;

import java.util.Date;

import lombok.Data;

@Data
public class ApplyTableDeatilDto {
	private int applyNo;
	private String MName;
	private Date applyDate;
	private Date complDate;
	private String dbaName;
	private String applyReason;
	private String rejectReason;
	private int approvalStatus;
	private String query;
	private String schemaName;
}
