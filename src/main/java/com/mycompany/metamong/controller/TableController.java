package com.mycompany.metamong.controller;

import java.util.List;

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

import com.mycompany.metamong.dto.ApplyColumnDto;
import com.mycompany.metamong.dto.ApplyListDto;
import com.mycompany.metamong.dto.ApplyTableDto;
import com.mycompany.metamong.dto.ColumnAddDto;
import com.mycompany.metamong.dto.TableAddDto;
import com.mycompany.metamong.dto.TableDto;
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
	@GetMapping("/tableSearch")
	public List<TableDto> tableSearch(@RequestParam String content,@RequestParam String schema){
		log.info("실행");
		return tableService.getTableSearch(content,schema);
	}
	
	@ResponseBody
	@PostMapping("/applyTable")
	public String applyTable(@RequestBody TableAddDto form,Authentication auth) {
		log.info("실행");
		log.info(form.toString());
		//신청내역	
		ApplyListDto applyList = new ApplyListDto();
		applyList.setMId(auth.getName());
		applyList.setApplyReason(form.getApplyReason());
		applyList.setApplyObj("TABLE");
		log.info(applyList.toString());
		applyListService.addApplyList(applyList);
		
		//sql문 생성
		/*String query = "";
		applyList.setQuery(query);*/
		
		
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
