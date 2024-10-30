package com.mycompany.metamong.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.metamong.dto.column.ColumnDto;
import com.mycompany.metamong.enums.SchemaEnum;
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
	@GetMapping("/searchColumnBySchema")
	public List<ColumnDto> searchColumn(
			@RequestParam SchemaEnum schemaName,
			@RequestParam int tableNo
			) {
		HashMap<String, Object> colParams = new HashMap<>();
		colParams.put("tableNo", tableNo);
		colParams.put("schemaName", schemaName.getSchemaName());
		return columnService.getColumnList(colParams);
	}
}
