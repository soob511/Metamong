package com.mycompany.metamong.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoMain.ApplyListDao;
import com.mycompany.metamong.daoMain.CodeDao;
import com.mycompany.metamong.daoMain.ItemDao;
import com.mycompany.metamong.dto.code.CodeDto;
import com.mycompany.metamong.dto.item.ItemDto;

@Service
public class CodeService {
	@Autowired
	private CodeDao codeDao;
	@Autowired
	private ItemDao itemDao;
	@Autowired
	private ApplyListDao applyListDao;

	public List<CodeDto> getCodeList() {
		return codeDao.selectCodeList();
	}
	
	public CodeDto getCodeByNo(int codeNo) {
		return codeDao.selectCodeByNo(codeNo);
	}
	
	public List<CodeDto> getCodeSearch(String keyword, int option) {
		return codeDao.selectCodeSearch(keyword, option);
	}

	public List<CodeDto> getActiveCodes() {
		return codeDao.selectActiveCodes();
	}

	public List<CodeDto> getCodeLoadSearch(String keyword) {
		return codeDao.selectCodeLoadSearch(keyword);
	}

	@Transactional
	public void insertCode(int applyNo, CodeDto code, List<ItemDto> items) {
		codeDao.insertCode(code);
		for (ItemDto item : items) {
			itemDao.insertItem(item);
		}
		applyListDao.updateStatus(applyNo);
	}
}