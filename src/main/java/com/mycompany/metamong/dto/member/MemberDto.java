package com.mycompany.metamong.dto.member;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class MemberDto {
	@JsonProperty("MId")
	private String MId;
	
	 @JsonProperty("MName")
	private String MName;
	 
	@JsonProperty("MPassword")
	private String MPassword;
	
	@JsonProperty("teamId")
	private int teamId;
	
	@JsonProperty("MEmpId")
	private String MEmpId;
	
	@JsonProperty("MTel")
	private String MTel;
	 
	@JsonProperty("MRole")
	private String MRole;

	@JsonProperty("MIsActive")
	private int MIsActive;
	
	private String profFilename;
	private String profFiletype;
	private byte[] profFiledata;
	private MultipartFile profFile;
	public int deleteProf;
	private Date MApplydate;
	private int MApprovalStatus;
	private Date MRegdate;
	private String teamName;
	private String newPassword;
}
