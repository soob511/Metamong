package com.mycompany.metamong.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.metamong.dto.column.ColumnDto;
import com.mycompany.metamong.service.ColumnService;

@Controller
@RequestMapping("/column")
public class ColumnController {
	
	@Autowired
	private ColumnService columnService;
	
	@ResponseBody
	@GetMapping("/columnList")
	private List<ColumnDto> columnList(@RequestParam int tableId){
		return columnService.getColumnList(tableId);
	}

	@ResponseBody
	@GetMapping("/searchColumnName")
	public List<ColumnDto> searchColumnName(
			@RequestParam String schemaName,
			@RequestParam String tableName
			) {
		return columnService.getColumnNameByDic(schemaName, tableName);
	}
	
	@ResponseBody
	@GetMapping("/searchColumnInfo")
	public List<ColumnDto> searchColumnInfo(
			@RequestParam String schemaName,
			@RequestParam int tableNo,
			@RequestParam String tableName
			) {
		return columnService.getColumnInfo(schemaName, tableNo, tableName);
	}
}
