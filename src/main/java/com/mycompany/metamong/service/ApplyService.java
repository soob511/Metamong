package com.mycompany.metamong.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoMain.ApplyListDao;
import com.mycompany.metamong.daoMain.CodeDao;
import com.mycompany.metamong.daoMain.ColumnDao;
import com.mycompany.metamong.daoMain.IndexDao;
import com.mycompany.metamong.daoMain.ItemDao;
import com.mycompany.metamong.daoMain.TableDao;
import com.mycompany.metamong.dto.Pager;
import com.mycompany.metamong.dto.applyList.ApplyCodeDeatilDto;
import com.mycompany.metamong.dto.applyList.ApplyCodeListDto;
import com.mycompany.metamong.dto.applyList.ApplyListDto;
import com.mycompany.metamong.dto.applyList.ApplyTableDeatilDto;
import com.mycompany.metamong.dto.code.ApplyCodeDto;
import com.mycompany.metamong.dto.code.CodeApplyDto;
import com.mycompany.metamong.dto.code.CodeDto;
import com.mycompany.metamong.dto.column.ApplyColumnDto;
import com.mycompany.metamong.dto.column.ColumnAddDto;
import com.mycompany.metamong.dto.index.ApplyIndexDetailDto;
import com.mycompany.metamong.dto.index.ApplyIndexDto;
import com.mycompany.metamong.dto.index.ApplyIndexListDto;
import com.mycompany.metamong.dto.item.ApplyItemDto;
import com.mycompany.metamong.dto.item.ItemApplyDto;
import com.mycompany.metamong.dto.item.ItemDto;
import com.mycompany.metamong.dto.table.ApplyTableDto;
import com.mycompany.metamong.dto.table.TableAddDto;

@Service
public class ApplyService {
	@Autowired
	private ApplyListDao applyListDao;
	@Autowired
	private CodeDao codeDao;
	@Autowired
	private ItemDao itemDao;
	@Autowired
	private IndexDao indexDao;
	@Autowired
	private TableDao tableDao;
	@Autowired
	private ColumnDao columnDao;

	public int getApplyCodeRows() {
		return applyListDao.selectApplyCodeRows();
	}
	
	public List<ApplyCodeListDto> getApplyCodeList(Pager pager) {
		return applyListDao.selectApplyCodeList(pager);
	}
	
	public ApplyCodeDeatilDto getCodeApplyDetail(int applyNo) {
		return applyListDao.selectCodeApplyDetail(applyNo);
	}
	
	public CodeDto getCodeApplyByNo(int applyNo) {
		return codeDao.selectCodeApplyByNo(applyNo);
	}
	
	public List<ItemDto> getItemsApplyByNo(int applyNo) {
		return itemDao.selectItemsByNo(applyNo);
	}

	public List<ApplyTableDto> getApplyTableList() {
		return applyListDao.selectApplyTableList();
	}

	public List<ApplyTableDto> getApplyTableSearch(Map<String, String> form) {
		return applyListDao.selectApplyTableSearch(form);
	}

	public ApplyTableDeatilDto getTableListDetail(int applyNo) {
		return applyListDao.selectTableListDetail(applyNo);
	}
	
	public void addApplyList(ApplyListDto apply) {
		applyListDao.insertApplyList(apply);	
	}
	
	@Transactional
	public void addApplyCode(CodeApplyDto form, Authentication auth) {
		ApplyListDto apply = new ApplyListDto();	
		apply.setMId(auth.getName());
		apply.setApplyReason(form.getApplyReason());		
		apply.setApplyObj("CODE");
		apply.setApplyType(form.getApplyType());				
		applyListDao.insertApplyList(apply);		

		ApplyCodeDto code = new ApplyCodeDto();
		code.setApplyNo(apply.getApplyNo());
		code.setCodeNo(form.getCodeNo());
		code.setCodeId(form.getCodeId());
		code.setCodeNm(form.getCodeNm());
		code.setCodeLength(form.getCodeLength());
		code.setCodeContent(form.getCodeContent());
		code.setCodeIsActive(form.getCodeIsActive());
		codeDao.insertApplyCode(code);
		
		List<ItemApplyDto> items = form.getItems();		
		for (ItemApplyDto i : items) {
			ApplyItemDto item = new ApplyItemDto();
	        item.setApplyNo(apply.getApplyNo());
	        item.setItemId(i.getItemId());
	        item.setItemNm(i.getItemNm());
	        item.setItemContent(i.getItemContent());
	        item.setItemIsActive(i.getItemIsActive());
	        item.setItemIsUpdate(i.getItemIsUpdate());
	        itemDao.insertApplyItem(item);
	    }
	}
	
	@Transactional
	public void addApplyIndex(ApplyListDto applyListDto, ApplyIndexDto applyIndexDto) {
		applyListDao.insertApplyList(applyListDto);
		applyIndexDto.setApplyNo(applyListDto.getApplyNo());
		indexDao.insertApplyIndex(applyIndexDto);
	}
	
	public List<ApplyIndexListDto> getApplyIndexList() {
		return applyListDao.selectApplyIndex();
	}
	
	public List<ApplyIndexListDto> getApplyIndexList(HashMap<String, Object> indexApplyListDatae) {
		return applyListDao.selectApplyIndexByParams(indexApplyListDatae);
	}
	
	public ApplyIndexDetailDto getApplyIndexListDetail(int applyNo) {
		return applyListDao.selectApplyIndexDetail(applyNo);
	}

	@Transactional
	public void addApplyTable(TableAddDto form, Authentication auth) {
	
		ApplyListDto applyList = new ApplyListDto();
		applyList.setMId(auth.getName());
		applyList.setSchemaName(form.getSchemaName());
		applyList.setApplyReason(form.getApplyReason());
		applyList.setApplyObj("TABLE");
		applyList.setApplyType(form.getApplyType());
		applyListDao.insertApplyList(applyList);	
		
		
		ApplyTableDto applyTable = new ApplyTableDto();
		applyTable.setApplyNo(applyList.getApplyNo());
		applyTable.setTableNm(form.getTableNm());
		applyTable.setTableId(form.getTableId());
		applyTable.setTableContent(form.getTableContent());
		tableDao.insertApplyTable(applyTable);
		
		List<ColumnAddDto> list = form.getColumns();
		ApplyColumnDto applyColumn = new ApplyColumnDto();
		
		int order = 0;
		for (ColumnAddDto column : list) {
			order += 1;
			applyColumn.setApplyNo(applyList.getApplyNo());
			applyColumn.setColId(column.getColId());
			applyColumn.setColNm(column.getColNm());
			applyColumn.setDataType(column.getDataType());
			applyColumn.setColLength(column.getColLength());
			applyColumn.setColIsnullable("NOTNULL".equals(column.getColNullable()) ? 0 : 1);
			applyColumn.setColIspk("N".equals(column.getColPk()) ? 0 : 1);
			applyColumn.setColOrder(order);
			columnDao.insertApplyColumn(applyColumn);	
		}

	}
}
