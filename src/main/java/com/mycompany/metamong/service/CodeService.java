package com.mycompany.metamong.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.metamong.daoMain.CodeDao;
import com.mycompany.metamong.dto.CodeDto;

@Service
public class CodeService {
	@Autowired
	private CodeDao codeDao;

	public List<CodeDto> getCodeList() {
		return codeDao.selectCodeList();
	}

}
