package com.mycompany.metamong.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.mycompany.metamong.dto.code.CodeUpdateDto;
import com.mycompany.metamong.dto.item.ApplyItemDto;
import com.mycompany.metamong.dto.item.ItemAddDto;
import com.mycompany.metamong.dto.item.ItemDto;
import com.mycompany.metamong.dto.item.ItemUpdateDto;
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
		apply.setApplyType("CREATE");
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
	public String codeUpdateForm(Model model, HttpSession session, @RequestParam int codeNo, @RequestParam int isUpdated) {
		List<ItemDto> items = itemService.getItemList(codeNo);
		if(isUpdated == 0) {
			CodeDto code = codeService.getCodeByNo(codeNo);
			model.addAttribute("code", code);
			model.addAttribute("items", items);
		} else {
			model.addAttribute("code", session.getAttribute("newCode"));
			model.addAttribute("items", session.getAttribute("newItems"));
		}
		model.addAttribute("itemLength", items.size());
		return "code/codeUpdateForm";
	}

	@PostMapping("/updateApplyCode")
	public String updateApplyCode(Authentication auth, @RequestBody CodeUpdateDto form) {
		// APPLY_LIST 테이블
		ApplyListDto apply = new ApplyListDto();	
		
		apply.setMId(auth.getName());
		apply.setApplyReason(form.getApplyReason());		
		apply.setApplyObj("CODE");
		apply.setApplyType("UPDATE");		
		applyService.addApplyList(apply);
				
		// APPLY_CODE 테이블
		ApplyCodeDto code = new ApplyCodeDto();

		code.setApplyNo(apply.getApplyNo());
		code.setCodeNo(form.getCodeNo());
		code.setCodeNm(form.getCodeNm());
		code.setCodeId(form.getCodeId());
		code.setCodeContent(form.getCodeContent());
		code.setCodeIsActive(form.getCodeIsActive());		
		codeService.updateApplyCode(code);
		
		// APPLY_ITEM 테이블
		List<ItemUpdateDto> inputItems = form.getItems();
			
		for (ItemUpdateDto inputItem : inputItems) {
			ApplyItemDto item = new ApplyItemDto();
			
	        item.setApplyNo(apply.getApplyNo());
	        item.setItemId(inputItem.getItemId());
	        item.setItemNm(inputItem.getItemNm());
	        item.setItemContent(inputItem.getItemContent());
	        item.setItemIsActive(inputItem.getItemIsActive());
	        item.setItemIsUpdate(inputItem.getItemIsUpdate());
	        itemService.updateApplyItem(item);
	    }
		return "code/codeApplyList";
	}
	
	@GetMapping("/codeCompareForm") 
	public String codeCompare(int codeNo) {
		return "code/codeCompareForm";
	}
	
	@PostMapping("/codeCompare")
	public String codeCompare(@RequestBody CodeUpdateDto form, HttpSession session) {
		CodeDto newCode = new CodeDto();
		newCode.setCodeNo(form.getCodeNo());
		newCode.setCodeNm(form.getCodeNm());
		newCode.setCodeId(form.getCodeId());
		newCode.setCodeContent(form.getCodeContent());
		newCode.setCodeIsActive(form.getCodeIsActive());

		session.setAttribute("newCode", newCode);
		session.setAttribute("newItems", form.getItems());
		
		int codeNo = form.getCodeNo();
		CodeDto oldCode = codeService.getCodeByNo(codeNo);
        List<ItemDto> oldItems = itemService.getItemList(codeNo);
        
        session.setAttribute("oldCode", oldCode);
        session.setAttribute("oldItems", oldItems);
		
		return "code/codeCompareForm";
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