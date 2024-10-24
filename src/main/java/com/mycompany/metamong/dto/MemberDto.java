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
	private int MIsActive;
	private String profFilename;
	private String profFiletype;
	private byte[] profFiledata;
	private Date MApplydate;
	private int MIsapprove;
	private Date MRegdate;
}
