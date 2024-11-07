package com.mycompany.metamong.dto.sequence;

import lombok.Data;

@Data
public class ApplySequenceDto {
	private int applyNo;
	private String seqName;
	private String seqFileName;
	private String seqFileType;
	private byte[] seqFileData;
}
