package com.mycompany.metamong.dto.applyList;

import java.util.Date;

import lombok.Data;

@Data
public class ApplyCodeDetailDto {
	private String MName;
	private Date applyDate;
	private Date complDate;
	private String dbaName;
	private String rejectReason;
	private int approvalStatus;
	private String applyReason;
}
