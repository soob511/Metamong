package com.mycompany.metamong.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.metamong.dto.applyList.ApplyListDto;
import com.mycompany.metamong.dto.code.ApplyCodeDto;
import com.mycompany.metamong.dto.code.CodeAddDto;
import com.mycompany.metamong.dto.code.CodeDto;
import com.mycompany.metamong.dto.item.ApplyItemDto;
import com.mycompany.metamong.dto.item.ItemAddDto;
import com.mycompany.metamong.dto.item.ItemDto;
import com.mycompany.metamong.service.ApplyListService;
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
	@Autowired
	private ApplyListService applyService;
	
	@GetMapping("/codeList")
	public String codeList(Model model) {
		List<CodeDto> codeList = codeService.getCodeList();
		List<List<ItemDto>> itemList = new ArrayList<>();
		
		for (CodeDto code : codeList) {
	        int codeNo = code.getCodeNo();
	        List<ItemDto> items = itemService.getItemList(codeNo);
	        itemList.add(items); 
	    }	
		
		model.addAttribute("codeList", codeList);
		model.addAttribute("itemList",itemList);

		return "code/codeList";
	}
	
	@ResponseBody
	@GetMapping("/codeSearch")
	public List<CodeDto> codeSearch(@RequestParam String keyword, @RequestParam int option) {
		return codeService.getCodeSearch(keyword, option);
	}
	
	@GetMapping("/codeAddForm")
	public String codeAddForm() {
		return "code/codeAddForm";
	}
	
	@PostMapping("/addApplyCode")
	public String addCode(Authentication auth, @RequestBody CodeAddDto form) {
		// APPLY_LIST 테이블
		ApplyListDto apply = new ApplyListDto();	
		
		apply.setMId(auth.getName());
		apply.setApplyReason(form.getApplyReason());		
		apply.setApplyObj("CODE");
		applyService.addApplyList(apply);
		
		// APPLY_CODE 테이블
		ApplyCodeDto code = new ApplyCodeDto();
		code.setApplyNo(apply.getApplyNo());
		code.setCodeNm(form.getCodeNm());
		code.setCodeId(form.getCodeId());
		code.setCodeContent(form.getCodeContent());		
		codeService.addApplyCode(code);
		
		// APPLY_ITEM 테이블
		List<ItemAddDto> inputItems = form.getItems();
		
		for (ItemAddDto inputItem : inputItems) {
			ApplyItemDto item = new ApplyItemDto();
	        item.setApplyNo(apply.getApplyNo());
	        item.setItemId(inputItem.getItemId());
	        item.setItemNm(inputItem.getItemNm());
	        item.setItemContent(inputItem.getItemContent());
	        itemService.addApplyItem(item);
	    }
		
		return "code/codeApplyList";
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
	
	@ResponseBody
	@GetMapping("/codeLoad")
	public List<CodeDto> codeLoad(){
		return codeService.getActiveCodes();
	}
	
	@ResponseBody
	@GetMapping("/codeLoadSearch")
	public List<CodeDto> codeLoadSearch(@RequestParam String keyword){
		keyword = keyword != null ? keyword.toUpperCase() : null;
		return codeService.getCodeLoadSearch(keyword);
	}
}
