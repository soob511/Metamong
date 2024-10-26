package com.mycompany.metamong.daoMain;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.TableDto;

@Mapper
public interface TableDao {

	public List<TableDto> selectTableList();

}
