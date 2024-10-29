package com.mycompany.metamong.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.metamong.dto.table.TableDto;
import com.mycompany.metamong.enums.SchemaEnum;
import com.mycompany.metamong.service.TableService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/table")
@Slf4j
public class TableController {
	
	@Autowired
	private TableService tableService;
	
	@GetMapping("/tableList")
	public String tableList(Model model) {
		List<TableDto> list = tableService.getTableList();
		model.addAttribute("schemaEnum", SchemaEnum.values());
		model.addAttribute("list", list);
		return "dbObject/table/tableList";
	}
	
	@ResponseBody
	@GetMapping("/tableSearch")
	public List<TableDto> tableSearch(@RequestParam String content,@RequestParam String schema){
		log.info("실행");
		return tableService.getTableSearch(content,schema);
	}
	
	@GetMapping("/tableCompare")
	public String tableCompare() {
		return "dbObject/table/tableCompare";
	}
	
	@GetMapping("/tableAddForm")
	public String tableAddForm(Model model) {
		model.addAttribute("schemaEnum", SchemaEnum.values());
		return "dbObject/table/tableAddForm";
	}
	
	@GetMapping("/tableUpdateForm")
	public String tableUpdateForm() {
		return "dbObject/table/tableUpdateForm";
	}
	
	@GetMapping("/tableApplyList")
	public String tableApplyList() {
		return "dbObject/table/tableApplyList";
	}
	
	@GetMapping("/tableApplyDetail")
	public String tableApplyDetail() {
		return "dbObject/table/tableApplyDetail";
	}

}
