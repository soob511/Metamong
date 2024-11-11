package com.mycompany.metamong.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.monitorjbl.xlsx.StreamingReader;
import com.mycompany.metamong.daoMain.ApplyListDao;
import com.mycompany.metamong.daoMain.CodeDao;
import com.mycompany.metamong.daoMain.ItemDao;
import com.mycompany.metamong.dto.code.CodeDto;
import com.mycompany.metamong.dto.code.CodeExcelDto;
import com.mycompany.metamong.dto.item.ApplyItemDto;
import com.mycompany.metamong.dto.item.ItemDto;
import com.mycompany.metamong.dto.item.ItemExcelDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
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
	public int insertCode(int applyNo, CodeDto code, List<ItemDto> items) {
		int result = 0;
		int isExist = codeDao.selectIsExistCode(code.getCodeId());
		
		if(isExist == 0) {
			codeDao.insertCode(code);
			for (ItemDto item : items) {
				itemDao.insertItem(item);
			}
			applyListDao.updateStatus(applyNo, 3);
			result = 1;
		} else {
			applyListDao.updateStatus(applyNo, 2);
			applyListDao.updateRejectReason(applyNo,"중복된 이름의 코드명(물리)가 존재합니다.");
		}
		return result;
	}
	
	@Transactional
	public void updateCode(int applyNo, CodeDto code, List<ApplyItemDto> items, int itemsLength) {
		codeDao.updateCode(code);
		
		for(int i = 0; i < items.size(); i++) {
			ApplyItemDto itm = items.get(i);
			ItemDto item = new ItemDto();
		 	item.setCodeNo(code.getCodeNo());
		 	item.setItemId(itm.getItemId());
		 	item.setItemNm(itm.getItemNm());
		 	item.setItemContent(itm.getItemContent());
		 	item.setItemIsActive(itm.getItemIsActive());
		 	
		 	if(itm.getItemIsUpdate() != 0) {
		 		if(i < itemsLength) {
			 		itemDao.updateItem(item);
			 	} else {
			 		itemDao.insertItem(item);		 		
			 	}
		 	}
		}
		applyListDao.updateStatus(applyNo, 3);
		
	}
	
	public Map<String, Object> uploadExcel(MultipartFile file) throws IllegalStateException, IOException {
	    InputStream inputStream = file.getInputStream();
	    
	    Workbook workbook = StreamingReader.builder().rowCacheSize(100).bufferSize(4096).open(inputStream);

	    // 1번 시트: code
	    Sheet codeSheet = workbook.getSheetAt(0);
	    List<CodeExcelDto> codeList = getCodeData(codeSheet);

	    // 2번 시트: items
	    Sheet itemSheet = workbook.getSheetAt(1);
	    List<ItemExcelDto> itemList = getItemData(itemSheet);

	    Map<String, Object> result = new HashMap<>();
	    result.put("codeList", codeList);
	    result.put("itemList", itemList);

	    return result;
	}

	public List<CodeExcelDto> getCodeData(Sheet sheet) {
	    List<CodeExcelDto> codeList = new ArrayList<>();
	    int cnt = 0;

	    for (Row row : sheet) {
	        if (cnt == 0) {
	            cnt++;
	            continue;
	        }

	        String[] arr = new String[5];

	        if (row.getCell(0) == null) {
	            break;
	        }

	        for (int i = 0; i < 5; i++) {
	            arr[i] = row.getCell(i) != null ? row.getCell(i).getStringCellValue() : "";
	        }

	        CodeExcelDto code = new CodeExcelDto();
	        code.setID(arr[0]);
	        code.setCodeId(arr[1]);
	        code.setCodeNm(arr[2]);
	        code.setCodeLength(arr[3]);
	        code.setCodeContent(arr[4]);

	        codeList.add(code);
	    }
	    return codeList;
	}

	public List<ItemExcelDto> getItemData(Sheet sheet) {
	    List<ItemExcelDto> itemList = new ArrayList<>();
	    int cnt = 0;

	    for (Row row : sheet) {
	        if (cnt == 0) {
	            cnt++;
	            continue;
	        }

	        String[] arr = new String[4];

	        if (row.getCell(0) == null) {
	            break;
	        }

	        for (int i = 0; i < 4; i++) {
	        	arr[i] = row.getCell(i) != null ? row.getCell(i).getStringCellValue() : "";
	        }

	        ItemExcelDto item = new ItemExcelDto();
	        item.setID(arr[0]);
	        item.setItemId(arr[1]);
	        item.setItemNm(arr[2]);
	        item.setItemContent(arr[3]);

	        itemList.add(item);
	    }
	    return itemList;
	}

}