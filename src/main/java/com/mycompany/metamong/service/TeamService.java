package com.mycompany.metamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoMain.TeamDao;
import com.mycompany.metamong.dto.team.TeamDto;

@Service
public class TeamService {
	
	@Autowired
	private TeamDao teamDao;

	public List<TeamDto> getTeamList() {
		return teamDao.selectTeamList();
	}

}
