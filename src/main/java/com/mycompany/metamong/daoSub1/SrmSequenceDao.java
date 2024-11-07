package com.mycompany.metamong.daoSub1;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.metamong.dto.sequence.SequenceDto;

@Mapper
public interface SrmSequenceDao {

	public List<SequenceDto> selectSequenceList();

	public List<SequenceDto> selectSearchSequence(String schema);


}
