package com.mycompany.metamong.daoMain;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.ApplyDto;

@Mapper
public interface ApplyDao {

	public int insertApply(ApplyDto apply);

}
