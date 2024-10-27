package com.mycompany.metamong.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.metamong.dto.CodeDto;
import com.mycompany.metamong.dto.ItemDto;
import com.mycompany.metamong.service.CodeService;
import com.mycompany.metamong.service.ItemService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/code")
public class CodeController {
	@Autowired
	private CodeService codeService;
	@Autowired
	private ItemService itemService;
	
	@GetMapping("/codeList")
	public String codeList(Model model) {
		List<CodeDto> codeList = codeService.getCodeList();
		List<List<ItemDto>> itemList = new ArrayList<>();
		
		for (CodeDto code : codeList) {
	        int codeNo = code.getCodeNo();
	        List<ItemDto> items = itemService.getItemList(codeNo);
	        itemList.add(items); 
	    }	
		
		log.info(itemList.toString());

		model.addAttribute("codeList", codeList);
		model.addAttribute("itemList",itemList);

		return "code/codeList";
	}
	
	@GetMapping("/codeAddForm")
	public String codeAddForm() {
		return "code/codeAddForm";
	}
	
	@GetMapping("/codeUpdateForm")
	public String codeUpdateForm() {
		return "code/codeUpdateForm";
	}

	@GetMapping("/codeCompare")
	public String codeCompare() {
		return "code/codeCompare";
	}
	
	@GetMapping("/codeApplyList")
	public String codeApplyList() {
		return "code/codeApplyList";
	}
	
	@GetMapping("/codeApplyDetail")
	public String codeApplyDetail() {
		return "code/codeApplyDetail";
	}
	
}
