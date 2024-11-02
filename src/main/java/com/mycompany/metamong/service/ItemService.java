package com.mycompany.metamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoMain.ItemDao;
import com.mycompany.metamong.dto.item.ItemDto;

@Service
public class ItemService {
	@Autowired
	private ItemDao itemDao;

	public List<ItemDto> getItemList(int codeNo) {
		return itemDao.selectItemList(codeNo);
	}

	public List<ItemDto> getItemsApplyByNo(int applyNo) {
		return itemDao.selectItemsByNo(applyNo);
	}
}
