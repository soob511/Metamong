package com.mycompany.metamong.daoMain;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.TeamDto;

@Mapper
public interface TeamDao {

	public List<TeamDto> selectTeamList();

}
