package com.mycompany.metamong.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.metamong.dto.applyList.ApplyCodeDeatilDto;
import com.mycompany.metamong.dto.applyList.ApplyListDto;
import com.mycompany.metamong.dto.code.ApplyCodeDto;
import com.mycompany.metamong.dto.code.CodeApplyDto;
import com.mycompany.metamong.dto.code.CodeDto;
import com.mycompany.metamong.dto.item.ApplyItemDto;
import com.mycompany.metamong.dto.item.ItemApplyDto;
import com.mycompany.metamong.dto.item.ItemDto;
import com.mycompany.metamong.service.ApplyService;
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
	private ApplyService applyService;
	
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
	
	@PostMapping("/applyCode")
	public ResponseEntity<String> applyCode(Authentication auth, @RequestBody CodeApplyDto form, HttpSession session) {
		// APPLY_LIST 테이블
		ApplyListDto apply = new ApplyListDto();	
		apply.setMId(auth.getName());
		apply.setApplyReason(form.getApplyReason());		
		apply.setApplyObj("CODE");
		apply.setApplyType(form.getApplyType());
		applyService.addApplyList(apply);

		// APPLY_CODE 테이블
		ApplyCodeDto code = new ApplyCodeDto();
		code.setApplyNo(apply.getApplyNo());
		code.setCodeNo(form.getCodeNo());
		code.setCodeId(form.getCodeId());
		code.setCodeNm(form.getCodeNm());
		code.setCodeLength(form.getCodeLength());
		code.setCodeContent(form.getCodeContent());
		code.setCodeIsActive(form.getCodeIsActive());
		applyService.addApplyCode(code);
		
		// APPLY_ITEM 테이블
		List<ItemApplyDto> inputItems = form.getItems();
		for (ItemApplyDto inputItem : inputItems) {
			ApplyItemDto item = new ApplyItemDto();
	        item.setApplyNo(apply.getApplyNo());
	        item.setItemId(inputItem.getItemId());
	        item.setItemNm(inputItem.getItemNm());
	        item.setItemContent(inputItem.getItemContent());
	        item.setItemIsActive(inputItem.getItemIsActive());
	        item.setItemIsUpdate(inputItem.getItemIsUpdate());
	        applyService.addApplyItem(item);
	    }
		
		session.removeAttribute("applyReason");
		return ResponseEntity.ok("/Metamong/code/codeApplyList");
	}
	
	@GetMapping("/codeUpdateForm")
	public String codeUpdateForm(Model model, HttpSession session, @RequestParam int codeNo, @RequestParam int isUpdated) {
		List<ItemDto> items = itemService.getItemList(codeNo);
		model.addAttribute("itemLength", items.size());
		
		if(isUpdated == 0) {
			CodeDto code = codeService.getCodeByNo(codeNo);
			List<ItemApplyDto> tmpItems = new ArrayList<ItemApplyDto>();

			for(ItemDto item : items) {
				ItemApplyDto tmpItem = new ItemApplyDto();
				tmpItem.setItemId(item.getItemId());
				tmpItem.setItemNm(item.getItemNm());
				tmpItem.setItemIsActive(item.getItemIsActive());
				tmpItem.setItemContent(item.getItemContent());
				tmpItem.setItemIsUpdate(0);
				tmpItems.add(tmpItem);
			}
			model.addAttribute("code", code);
			model.addAttribute("items", tmpItems);
		} else { 
			model.addAttribute("code", session.getAttribute("newCode"));
			model.addAttribute("items", session.getAttribute("newItems"));
		}
		return "code/codeUpdateForm";
	}
	
	@GetMapping("/codeCompareForm") 
	public String codeCompare(Model model, int codeNo) {
		CodeDto oldCode = codeService.getCodeByNo(codeNo);
	    List<ItemDto> oldItems = itemService.getItemList(codeNo);
	    
	    model.addAttribute("oldCode", oldCode);
	    model.addAttribute("oldItems", oldItems);

		return "code/codeCompareForm";
	}
	
	@PostMapping("/codeCompare")
	public ResponseEntity<String> codeCompare(@RequestBody CodeApplyDto form, HttpSession session) {
		CodeDto newCode = new CodeDto();
		newCode.setCodeNo(form.getCodeNo());
		newCode.setCodeId(form.getCodeId());
		newCode.setCodeNm(form.getCodeNm());
		newCode.setCodeLength(form.getCodeLength());
		newCode.setCodeContent(form.getCodeContent());
		newCode.setCodeIsActive(form.getCodeIsActive());

		session.setAttribute("newCode", newCode);
		session.setAttribute("newItems", form.getItems());
		session.setAttribute("applyReason", form.getApplyReason());
	
        return ResponseEntity.ok("/Metamong/code/codeCompareForm?codeNo=" + form.getCodeNo());
	}
	
	@GetMapping("/codeApplyList")
	public String codeApplyList(Model model) {
		List<ApplyCodeDto> list = applyService.getApplyCodeList();
		model.addAttribute("list", list);
		return "code/codeApplyList";
	}
	
	@GetMapping("/codeApplyDetail")
	public String codeApplyDetail(Model model, int applyNo, int indexNo) {
		ApplyCodeDeatilDto applyList = applyService.getCodeApplyDetail(applyNo); 
		model.addAttribute("applyList", applyList);
		model.addAttribute("indexNo", indexNo);
		
		CodeDto applyCode = applyService.getCodeApplyByNo(applyNo);
		model.addAttribute("applyCode", applyCode);
		
		List<ItemDto> applyItems = applyService.getItemsApplyByNo(applyNo);
		model.addAttribute("applyItems",applyItems);
		
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