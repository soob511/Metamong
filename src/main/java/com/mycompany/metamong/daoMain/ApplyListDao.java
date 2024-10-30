package com.mycompany.metamong.daoMain;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.applyList.ApplyListDto;
import com.mycompany.metamong.dto.table.ApplyTableDto;

@Mapper
public interface ApplyListDao {

	public int insertApplyList(ApplyListDto apply);

	public List<ApplyTableDto> selectApplyTableList();

}
