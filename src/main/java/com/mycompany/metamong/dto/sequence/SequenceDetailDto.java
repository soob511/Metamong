package com.mycompany.metamong.dto.sequence;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class SequenceDetailDto {
	private int applyNo;
	private int indexNo;
	private Date applyDate;
	private Date complDate;
	private String dbaName;
	@JsonProperty("MName")
	private String MName;
	private String applyReason;
	private String rejectReason;
	private int approvalStatus;
	private String schemaName;
	private String seqName;
	private String query;
	private String seqFileName;
	private String seqFileType;
	private byte[] seqFileData;
}
