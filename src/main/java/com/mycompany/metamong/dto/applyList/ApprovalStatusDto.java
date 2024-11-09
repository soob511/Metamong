package com.mycompany.metamong.dto.applyList;

import lombok.Data;

@Data
public class ApprovalStatusDto {
	private int totalCount;
	private int awaitCount;
	private int approvedCount;
	private int rejectedCount;
	private int reflectCount;
}
