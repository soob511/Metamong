package com.mycompany.metamong.dto;

import java.util.Date;

import lombok.Data;

@Data
public class MemberDto {
	private String MId;
	private String MName;
	private String MPassword;
	private int teamId;
	private String MEmpId;
	private int MTel;
	private String MRole;
	private boolean MIsActive;
	private String profFilename;
	private String profFiletype;
	private byte[] profFiledata;
	private Date MApplydate;
	private boolean MIsapprove;
	private Date MRegdate;
}
