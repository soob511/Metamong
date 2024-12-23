package com.mycompany.metamong.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.metamong.dto.team.TeamDto;
import com.mycompany.metamong.service.TeamService;

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
	
	@ResponseBody
	@PostMapping("/updateTeam")
	public ResponseEntity <String> updateTeam(@RequestBody List<TeamDto> list) {
		
	    for (TeamDto teams : list) {
	    	TeamDto team = new TeamDto();
	    	team.setTeamId(teams.getTeamId());
	    	team.setTeamName(teams.getTeamName());
	    	team.setTeamIsactive(teams.getTeamIsactive());
	    	team.setTeamIsupdate(teams.getTeamIsupdate());
	    	
	    	if(teams.getTeamIsupdate() == 1) {
	    		teamService.insertTeam(teams);
	    	}else if(teams.getTeamIsupdate()==2) {
	    		teamService.updateTeam(teams);
	    	}
	    }
	    return ResponseEntity.ok("ok");
}
}
