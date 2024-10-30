package com.mycompany.metamong.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.metamong.dto.ColumnDto;
import com.mycompany.metamong.dto.IndexDto;
import com.mycompany.metamong.dto.TableDto;
import com.mycompany.metamong.enums.SchemaEnum;
import com.mycompany.metamong.service.ColumnService;
import com.mycompany.metamong.service.IndexService;
import com.mycompany.metamong.service.TableService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/index")
public class IndexController {
	@Autowired
	private IndexService indexService;
	@Autowired
	private TableService tableService;
	@Autowired
	private ColumnService columnService;
	
	@GetMapping("/indexList")
	public String indexList(Model model) {
		List<IndexDto> list = indexService.getIndexList();
		model.addAttribute("schemaEnum", SchemaEnum.values());
		model.addAttribute("list", list);
		return "dbObject/index/indexList";
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
	
	@ResponseBody
	@GetMapping("/searchColumn")
	public List<ColumnDto> searchColumn(
			@RequestParam SchemaEnum schemaName,
			@RequestParam int tableNo
			) {
		HashMap<String, Object> colParams = new HashMap<>();
		colParams.put("tableNo", tableNo);
		colParams.put("schemaName", schemaName.getSchemaName());
		return columnService.getColumnList(colParams);
	}
	
	@GetMapping("/indexAddForm")
	public String indexAddForm(Model model) {
		model.addAttribute("schemaEnum", SchemaEnum.values());
		return "dbObject/index/indexAddForm";
	}
	
	@PostMapping("/indexAdd")
	public void indexAdd(@RequestBody IndexDto index) {
		
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
