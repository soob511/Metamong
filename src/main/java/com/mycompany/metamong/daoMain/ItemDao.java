package com.mycompany.metamong.daoMain;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.metamong.dto.item.ApplyItemDto;
import com.mycompany.metamong.dto.item.ItemDto;

@Mapper
public interface ItemDao {
	
	public List<ItemDto> selectItemList(int codeNo);

	public List<ItemDto> selectItemsByNo(int applyNo);	

	public int insertApplyItem(ApplyItemDto item);

	public int insertItem(ItemDto item);
}
