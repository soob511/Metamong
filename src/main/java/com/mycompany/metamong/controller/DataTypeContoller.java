package com.mycompany.metamong.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.metamong.dto.dataType.DataTypeDto;
import com.mycompany.metamong.service.DataTypeService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/dataType")
@Slf4j
public class DataTypeContoller {
	
	@Autowired
	private DataTypeService dataTypeService;
	
	@ResponseBody
	@GetMapping("/dataTypeList")
	public List<DataTypeDto> dataTypeList(){
		log.info("실행");
		return dataTypeService.getDataTypeList();
	}

}
