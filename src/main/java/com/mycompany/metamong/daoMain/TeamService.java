package com.mycompany.metamong.daoMain;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.dto.member.TeamDto;

@Service
public class TeamService {
	
	@Autowired
	private TeamDao teamDao;

	public List<TeamDto> getTeamList() {
		return teamDao.selectTeamList();
	}

}
