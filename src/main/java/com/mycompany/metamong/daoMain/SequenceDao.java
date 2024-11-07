package com.mycompany.metamong.daoMain;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.sequence.ApplySequenceDto;

@Mapper
public interface SequenceDao {

	public int insertApplySequence(ApplySequenceDto applySequence);

}
