package com.mycompany.metamong.daoMain;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.ItemDto;

@Mapper
public interface ItemDao {
	
	public List<ItemDto> selectItemList(int codeNo);
	
}
