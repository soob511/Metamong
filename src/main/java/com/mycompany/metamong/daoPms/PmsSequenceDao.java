package com.mycompany.metamong.daoPms;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.sequence.SequenceDto;

@Mapper
public interface PmsSequenceDao {

	public List<SequenceDto> selectSequenceList();

	public List<SequenceDto> selectSearchSequence(String keyword);

	public int createSequence(String sql);

}
