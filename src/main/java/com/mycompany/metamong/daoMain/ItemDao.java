package com.mycompany.metamong.daoMain;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.metamong.dto.item.ApplyItemDto;
import com.mycompany.metamong.dto.item.ItemDto;

@Mapper
public interface ItemDao {
	
	public List<ItemDto> selectItemList(int codeNo);

	public List<ItemDto> selectItemsByNo(int applyNo);	

	public List<ApplyItemDto> selectApplyItemsByNo(int applyNo);
	
	public List<ItemDto> selectItemsExcelByNo(@Param(value="applyNo") int applyNo, @Param(value="codeNo") int codeNo);
	
	public int insertApplyItem(ApplyItemDto item);

	public int insertItem(ItemDto item);

	public int updateItem(ItemDto item);

}
