package com.mycompany.metamong.daoMain;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.ApplyListDto;

@Mapper
public interface ApplyListDao {

	public int insertApplyList(ApplyListDto apply);

}
