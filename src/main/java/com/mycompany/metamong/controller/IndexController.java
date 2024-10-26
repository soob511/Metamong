package com.mycompany.metamong.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.metamong.dto.IndexDto;
import com.mycompany.metamong.enums.SchemaEnums;
import com.mycompany.metamong.service.IndexService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/index")
public class IndexController {
	@Autowired
	private IndexService indexService;
	
	@GetMapping("/indexList")
	public String indexList(Model model) {
		List<IndexDto> list = indexService.getIndexList();			
		model.addAttribute("list", list);
		return "dbObject/index/indexList";
	}
	
	@ResponseBody
	@GetMapping("/searchIndex")
	public List<IndexDto> searchIndex(
			@RequestParam SchemaEnums schemaName,
			@RequestParam String indexName
			) {
		List<IndexDto> list = new ArrayList<>();
		if (!indexName.isEmpty()) {
			list = indexService.getIndexList(schemaName, indexName);
		} else {
			list = indexService.getIndexList(schemaName);			
		}
		log.info("찾아줘" + list);
		return list;
	}
	
	@GetMapping("/indexAddForm")
	public String indexAddForm() {
		return "dbObject/index/indexAddForm";
	}
	
	@GetMapping("/indexDeleteForm")
	public String indexDeleteForm() {
		return "dbObject/index/indexDeleteForm";
	}
	
	@GetMapping("/indexApplyList")
	public String indexApplyList() {
		return "dbObject/index/indexApplyList";
	}
	
	@GetMapping("/indexDetail")
	public String indexDetail() {
		return "dbObject/index/indexDetail";
	}
}
