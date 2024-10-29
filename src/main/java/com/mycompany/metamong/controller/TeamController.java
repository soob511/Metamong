package com.mycompany.metamong.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.metamong.daoMain.TeamService;
import com.mycompany.metamong.dto.team.TeamDto;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/team")
@Slf4j
public class TeamController {
	
	@Autowired
	private TeamService teamService;
	
	@ResponseBody
	@GetMapping("/getTeamList")
	public List<TeamDto> getTeamList() {
		return teamService.getTeamList();
	}

}
