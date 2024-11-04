package com.mycompany.metamong.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.metamong.dto.Pager;
import com.mycompany.metamong.dto.applyList.ApplyTableDeatilDto;
import com.mycompany.metamong.dto.column.ColumnDto;
import com.mycompany.metamong.dto.column.NewColumnDto;
import com.mycompany.metamong.dto.column.PreColumnDto;
import com.mycompany.metamong.dto.table.ApplyTableDto;
import com.mycompany.metamong.dto.table.TableAddDto;
import com.mycompany.metamong.dto.table.TableCompareDto;
import com.mycompany.metamong.dto.table.TableDto;
import com.mycompany.metamong.enums.SchemaEnum;
import com.mycompany.metamong.service.ApplyService;
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
	private ApplyService applyService;

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
	public List<TableDto> searchTable(@RequestParam SchemaEnum schemaName) {
		return tableService.getTableName(schemaName);
	}

	@ResponseBody
	@GetMapping("/tableSearch")
	public List<TableDto> tableSearch(@RequestParam String content, @RequestParam String schema) {
		content = content != null ? content.toUpperCase() : null;
		return tableService.getTableSearch(content, schema);
	}

	@GetMapping("/tableAddForm")
	public String tableAddForm(Model model) {
		model.addAttribute("schemaEnum", SchemaEnum.values());
		return "dbObject/table/tableAddForm";
	}

	@ResponseBody
	@PostMapping("/applyTable")
	public ResponseEntity<String> applyTable(@RequestBody TableAddDto form, Authentication auth) {

		applyService.addApplyTable(form,auth);

		return ResponseEntity.ok("/Metamong/table/tableApplyList");
	}

	@GetMapping("/tableUpdateForm")
	public String tableUpdateForm(@RequestParam int tableNo,@RequestParam int updateNo, Model model,HttpSession session) {
		TableDto table = tableService.getTable(tableNo);
		model.addAttribute("table", table);

		if(updateNo==0) {
			List<ColumnDto> column = columnService.getColumnList(tableNo);
			model.addAttribute("column", column);
			model.addAttribute("visit", false);
		}else {
			model.addAttribute("column", session.getAttribute("afterColumn"));
			 model.addAttribute("visit", true);
		}
		
		session.removeAttribute("applyReason");
		
		return "dbObject/table/tableUpdateForm";
	}
	
	@GetMapping("/tableCompareForm")
	public String tableCompareForm(Model model,int tableNo) {

		TableDto table = tableService.getTable(tableNo);
		model.addAttribute("table", table);

		List<ColumnDto> beforeColumn = columnService.getColumnList(tableNo);
		model.addAttribute("beforeColumn", beforeColumn);
		
		return "dbObject/table/tableCompareForm";
	}

	@PostMapping("/tableCompare")
	public ResponseEntity<String> tableCompare(@RequestBody TableCompareDto form, HttpSession session) {

		int tableNo = form.getTableNo();
		
		List<NewColumnDto> afterColumn = form.getColumns();
		session.setAttribute("afterColumn", afterColumn);
		
		String applyReason = form.getApplyReason();
		session.setAttribute("applyReason", applyReason);

		return ResponseEntity.ok("/Metamong/table/tableCompareForm?tableNo=" + tableNo);
	}

	@GetMapping("/tableApplyList")
	public String tableApplyList(@RequestParam(defaultValue="1") int pageNo, 
			HttpSession session,Model model) {
		
		int totalRows = applyService.getTotalRows();
		
		Pager pager = new Pager(10,5,totalRows,pageNo);
		session.setAttribute("pager", pager);
		
		List<ApplyTableDto> list = applyService.getApplyTableList(pager);
		model.addAttribute("list", list);
		model.addAttribute("schemaEnum", SchemaEnum.values());
		return "dbObject/table/tableApplyList";
	}

	@GetMapping("/tableListDetail")
	public String tableListDetail(int applyNo, int indexNo, Model model) {

		ApplyTableDeatilDto applyList = applyService.getTableListDetail(applyNo);
		model.addAttribute("applyList", applyList);
		model.addAttribute("indexNo", indexNo);

		TableDto applyTable = tableService.getTableByApplyNo(applyNo);
		model.addAttribute("applyTable", applyTable);

		List<ColumnDto> applyColumnList = columnService.getColumnByApplyNo(applyNo);
		model.addAttribute("applyColumn", applyColumnList);

		return "dbObject/table/tableApplyDetail";

	}

	@ResponseBody
	@GetMapping("/applyTableSearch")
	public List<ApplyTableDto> applyTableSearch(@RequestParam Map<String, String> form) {
		log.info("실행");
		List<ApplyTableDto> list = applyService.getApplyTableSearch(form);
		log.info(list.toString());
		return list;
	}

	@GetMapping("/tableApplyDetail")
	public String tableApplyDetail() {
		return "dbObject/table/tableApplyDetail";
	}

}
