package com.mycompany.metamong.service;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoMain.ApplyListDao;
import com.mycompany.metamong.daoMain.CodeDao;
import com.mycompany.metamong.daoMain.IndexDao;
import com.mycompany.metamong.daoMain.ItemDao;
import com.mycompany.metamong.dto.applyList.ApplyCodeDeatilDto;
import com.mycompany.metamong.dto.applyList.ApplyListDto;
import com.mycompany.metamong.dto.applyList.ApplyTableDeatilDto;
import com.mycompany.metamong.dto.code.ApplyCodeDto;
import com.mycompany.metamong.dto.code.CodeDto;
import com.mycompany.metamong.dto.index.ApplyIndexDto;
import com.mycompany.metamong.dto.item.ApplyItemDto;
import com.mycompany.metamong.dto.item.ItemDto;
import com.mycompany.metamong.dto.table.ApplyTableDto;

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

	public List<ApplyCodeDto> getApplyCodeList() {
		return applyListDao.selectApplyCodeList();
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
	
	public void addApplyCode(ApplyCodeDto code) {
		codeDao.insertApplyCode(code);
	}
	
	public void addApplyItem(ApplyItemDto item) {
		itemDao.insertApplyItem(item);
	}
	
	@Transactional
	public void addApplyIndex(ApplyListDto applyListDto, ApplyIndexDto applyIndexDto) {
		applyListDao.insertApplyList(applyListDto);
		applyIndexDto.setApplyNo(applyListDto.getApplyNo());
		indexDao.insertApplyIndex(applyIndexDto);
	}
}
