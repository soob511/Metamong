package com.mycompany.metamong.controller;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

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
import com.mycompany.metamong.dto.column.ApplyColumnDto;
import com.mycompany.metamong.dto.column.ColumnAddDto;
import com.mycompany.metamong.dto.table.ApplyTableDto;
import com.mycompany.metamong.dto.table.TableAddDto;
import com.mycompany.metamong.dto.table.TableDto;
import com.mycompany.metamong.enums.SchemaEnum;
import com.mycompany.metamong.service.ApplyListService;
import com.mycompany.metamong.service.ColumnService;
import com.mycompany.metamong.service.TableService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/table")
@Slf4j
public class TableController {
	
	@Autowired
	private TableService tableService;
	
	@Autowired
	private ApplyListService applyListService;
	
	@Autowired
	private ColumnService columnService;
	
	@GetMapping("/tableList")
	public String tableList(Model model) {
		List<TableDto> list = tableService.getTableList();
		model.addAttribute("schemaEnum", SchemaEnum.values());
		model.addAttribute("list", list);
		return "dbObject/table/tableList";
	}
	
	@ResponseBody
	@GetMapping("/searchTableBySchema")
	public List<TableDto> searchTable(
			@RequestParam SchemaEnum schemaName
			) {
		return tableService.getTableName(schemaName);			
	}
	
	@ResponseBody
	@GetMapping("/tableSearch")
	public List<TableDto> tableSearch(@RequestParam String content,@RequestParam String schema){
			content = content != null ? content.toUpperCase() : null;
		return tableService.getTableSearch(content,schema);
	}
	
	@GetMapping("/tableAddForm")
	public String tableAddForm(Model model) {
		model.addAttribute("schemaEnum", SchemaEnum.values());
		return "dbObject/table/tableAddForm";
	}
	
	@ResponseBody
	@PostMapping("/applyTable")
	public String applyTable(@RequestBody TableAddDto form,Authentication auth) {
		log.info("실행");
		log.info(form.toString());
		//신청내역	
		ApplyListDto applyList = new ApplyListDto();
		applyList.setMId(auth.getName());
		applyList.setSchemaName(form.getSchemaName());
		applyList.setApplyReason(form.getApplyReason());
		applyList.setApplyObj("TABLE");
		applyList.setApplyType("CREATE");
		log.info(applyList.toString());
		applyListService.addApplyList(applyList);

		//테이블 신청내역
		ApplyTableDto applyTable = new ApplyTableDto();
		applyTable.setApplyNo(applyList.getApplyNo());
		applyTable.setTableNm(form.getTableNm());
		applyTable.setTableId(form.getTableId());
		applyTable.setTableContent(form.getTableContent());
		tableService.addApplyTable(applyTable);
		
		//컬럼신청내역
		List<ColumnAddDto> list = form.getColumns();
		ApplyColumnDto applyColumn = new ApplyColumnDto();
		
		int order = 0;
		for(ColumnAddDto column:list) {
			order+=1;
			applyColumn.setApplyNo(applyList.getApplyNo());
			applyColumn.setColId(column.getColId());
			applyColumn.setColNm(column.getColNm());
			applyColumn.setDataType(column.getDataType());
			applyColumn.setColLength(column.getColLength());
			applyColumn.setColIsnullable(column.getColNullable()=="NOTNULL"?0:1);
			applyColumn.setColIspk(column.getColPk()=="N"?0:1);
			applyColumn.setColOrder(order);
			columnService.addApplyColumn(applyColumn);
		}
		return "dbObject/table/tableApplyList";
	}
	
	@GetMapping("/tableCompare")
	public String tableCompare() {
		return "dbObject/table/tableCompare";
	}
	
	@GetMapping("/tableUpdateForm")
	public String tableUpdateForm() {
		return "dbObject/table/tableUpdateForm";
	}
	
	@GetMapping("/tableApplyList")
	public String tableApplyList(Model model) {
		List<ApplyTableDto> list = applyListService.getApplyTableList();
		model.addAttribute("list", list);
		model.addAttribute("schemaEnum",SchemaEnum.values());
		return "dbObject/table/tableApplyList";
	}
	
	@ResponseBody
	@GetMapping("/applyTableSearch")
	public List<ApplyTableDto> applyTableSearch(@RequestParam Map<String, String> form) {
		log.info("실행");
		List<ApplyTableDto> list= applyListService.getApplyTableSearch(form);
		log.info(list.toString());
	    return list;
	}

	
	@GetMapping("/tableApplyDetail")
	public String tableApplyDetail() {
		return "dbObject/table/tableApplyDetail";
	}

}
