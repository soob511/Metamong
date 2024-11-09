package com.mycompany.metamong.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.metamong.dto.item.ItemDto;
import com.mycompany.metamong.service.ApplyService;
import com.mycompany.metamong.service.ItemService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/item")
public class ItemController {
	@Autowired
	private ItemService itemService;
	@Autowired
	private ApplyService applyService;
	
	@ResponseBody
	@GetMapping("/itemList")
	public List<ItemDto> itemList(@RequestParam int codeNo) {
		return itemService.getItemList(codeNo);
	}
	
	@ResponseBody
	@GetMapping("/itemApplyExcelList")
	public List<ItemDto> itemApplyExcelList (int applyNo, int codeNo) {
		List<ItemDto> applyItems = applyService.getItemsApplyExcelByNo(applyNo, codeNo);			
		return applyItems;
	}
}
