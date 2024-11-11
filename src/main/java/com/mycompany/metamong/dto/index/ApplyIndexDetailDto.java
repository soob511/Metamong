package com.mycompany.metamong.dto.index;

import java.util.Date;

import lombok.Data;

@Data
public class ApplyIndexDetailDto {
	private int applyNo;
	private Date applyDate;
	private Date complDate;
	private String MName;
	private String dbaName;
	private String idxName;
	private String schemaName;
	private String tableId;
	private String refColumn;
	private int isUnique;
	private String applyReason;
	private String rejectReason;
	private int approvalStatus;
	private String query;
	private String applyType;
	private int tableNo;
}
