package com.mycompany.metamong.dto.sequence;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class SequenceApplyListDto {
	private int applyNo;
	@JsonProperty("MName")
	private String MName;
	private Date applyDate;
	private String seqName;
	private String schemaName;
	private String applyType;
	private String applyObj;
	private int approvalStatus;

}
