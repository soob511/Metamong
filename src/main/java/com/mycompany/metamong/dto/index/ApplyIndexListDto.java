package com.mycompany.metamong.dto.index;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ApplyIndexListDto {
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private int applyNo;
	private Date applyDate;
	private String MName;
	private String schemaName;
	private String idxName;
	private String applyObj;
	private int approvalStatus;
	
	public String getFmtApplyDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return applyDate != null ? sdf.format(applyDate) : "";
    }
}
