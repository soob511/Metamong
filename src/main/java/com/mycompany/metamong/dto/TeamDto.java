package com.mycompany.metamong.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class TeamDto {

	private int teamId;
	
	private String teamName;
	
	private String teamIsactive;
	
}
