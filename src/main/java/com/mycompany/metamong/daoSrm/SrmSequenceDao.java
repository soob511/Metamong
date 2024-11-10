package com.mycompany.metamong.daoSrm;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.metamong.dto.sequence.SequenceDto;

@Mapper
public interface SrmSequenceDao {

	public List<SequenceDto> selectSequenceList();

	public List<SequenceDto> selectSearchSequence(String schema);

	public int createSequence(String sql);



}
