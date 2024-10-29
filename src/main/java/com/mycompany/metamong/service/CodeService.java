package com.mycompany.metamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoMain.CodeDao;
import com.mycompany.metamong.dto.code.ApplyCodeDto;
import com.mycompany.metamong.dto.code.CodeDto;

@Service
public class CodeService {
	@Autowired
	private CodeDao codeDao;

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

	public void addApplyCode(ApplyCodeDto code) {
		codeDao.insertApplyCode(code);
	}

	

	
}
