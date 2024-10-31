package com.mycompany.metamong.dto.index;

import java.util.List;

import com.mycompany.metamong.dto.applyList.ApplyListDto;

import lombok.Data;

@Data
public class ApplyIndexRequest {
	private ApplyListDto applyListDto;
	private ApplyIndexDto applyIndexDto;
	private List<RefColumn> refColumn;
}
