package com.mycompany.metamong.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.metamong.dto.ColumnDto;
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

}