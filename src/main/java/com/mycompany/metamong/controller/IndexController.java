package com.mycompany.metamong.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringJoiner;

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

import com.mycompany.metamong.dto.index.ApplyIndexDetailDto;
import com.mycompany.metamong.dto.index.ApplyIndexListDto;
import com.mycompany.metamong.dto.index.ApplyIndexRequestDto;
import com.mycompany.metamong.dto.index.IndexDto;
import com.mycompany.metamong.dto.index.RefColumnDto;
import com.mycompany.metamong.enums.SchemaEnum;
import com.mycompany.metamong.service.ApplyService;
import com.mycompany.metamong.service.IndexService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/index")
public class IndexController {
	@Autowired
	private IndexService indexService;
	@Autowired
	private ApplyService applyService;
	
	@GetMapping("/indexList")
	public String indexList(Model model) {
		List<IndexDto> list = indexService.getIndexList();
		model.addAttribute("schemaEnum", SchemaEnum.values());
		model.addAttribute("list", list);
		return "dbObject/index/indexList";
	}
	
	@ResponseBody
	@GetMapping("/searchIndexAll")
	public List<IndexDto> searchIndexAll(@RequestParam String indexName) {
		List<IndexDto> list = new ArrayList<>();
		if (indexName != "") {
			list = indexService.getIndexList(indexName);			
		} else {
			list = indexService.getIndexList();
		}
		return list;
	}
	
	@ResponseBody
	@GetMapping("/searchIndex")
	public List<IndexDto> searchIndex(
			@RequestParam SchemaEnum schemaName,
			@RequestParam String indexName
			) {
		List<IndexDto> list = new ArrayList<>();
		if (!indexName.isEmpty()) {
			list = indexService.getIndexList(schemaName, indexName);
		} else {
			list = indexService.getIndexList(schemaName);			
		}
		return list;
	}
	
	@GetMapping("/indexAddForm")
	public String indexAddForm(Model model) {
		model.addAttribute("schemaEnum", SchemaEnum.values());
		return "dbObject/index/indexAddForm";
	}
	
	@ResponseBody
	@PostMapping("/applyIndex")
	public void applyIndex(
			@RequestBody ApplyIndexRequestDto applyIndexRequest,
			Authentication authentication
			) {
		StringJoiner joiner = new StringJoiner(", ");
		for (RefColumnDto refColumn : applyIndexRequest.getRefColumn()) {
		    joiner.add(refColumn.getColId() + " " + refColumn.getColOrder());
		}
		String combineRefColumn = joiner.toString();
		applyIndexRequest.getApplyListDto().setMId(authentication.getName());
		applyIndexRequest.getApplyIndexDto().setRefColumn(combineRefColumn);
		applyService.addApplyIndex(applyIndexRequest.getApplyListDto(), applyIndexRequest.getApplyIndexDto());
	}
	
	@ResponseBody
	@PostMapping("/applyIndexDelete")
	public void applyIndexDelete(
			@RequestBody List<ApplyIndexRequestDto> applyIndexRequest,
			Authentication authentication) {
//		applyIndexRequest.getApplyListDto().setMId(authentication.getName());
//		applyIndexRequest.getApplyIndexDto().setRefColumn(combineRefColumn);
//		applyService.addApplyIndex(applyIndexRequest.getApplyListDto(), applyIndexRequest.getApplyIndexDto());
	}
	
	@GetMapping("/indexDeleteForm")
	public String indexDeleteForm(Model model) {
		List<IndexDto> list = indexService.getIndexList();
		model.addAttribute("schemaEnum", SchemaEnum.values());
		model.addAttribute("list", list);
		return "dbObject/index/indexDeleteForm";
	}
	
	@GetMapping("/indexApplyList")
	public String indexApplyList(Model model) {
		List<ApplyIndexListDto> list = applyService.getApplyIndexList();
		model.addAttribute("schemaEnum", SchemaEnum.values());
		model.addAttribute("list", list);
		return "dbObject/index/indexApplyList";
	}
	
	@ResponseBody
	@GetMapping("/searchApplyIndex")
	public List<ApplyIndexListDto> searchApplyIndex(@RequestParam HashMap<String, Object> indexApplyListData) {
		List<ApplyIndexListDto> list = applyService.getApplyIndexList(indexApplyListData);
		return list;
	}
	
	@GetMapping("/indexApplyDetail")
	public String indexApplyDetail(@RequestParam int applyNo,@RequestParam int indexNo, Model model) {
		ApplyIndexDetailDto applyIndexDetail = applyService.getApplyIndexListDetail(applyNo);
		model.addAttribute("detail", applyIndexDetail);
		model.addAttribute("no", indexNo);
		return "dbObject/index/indexApplyDetail";
	}
}
