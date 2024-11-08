package com.mycompany.metamong.daoMain;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.sequence.ApplySequenceDto;
import com.mycompany.metamong.dto.sequence.SequenceDetailDto;

@Mapper
public interface SequenceDao {

	public int insertApplySequence(ApplySequenceDto applySequence);

	public SequenceDetailDto selectSequenceDetail(int applyNo);

}
