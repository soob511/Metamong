package com.mycompany.metamong.daoSub3;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.sequence.SequenceDto;

@Mapper
public interface HrSequenceDao {

	public List<SequenceDto> selectSequenceList();

	public List<SequenceDto> selectSearchSequence(String keyword);

}
