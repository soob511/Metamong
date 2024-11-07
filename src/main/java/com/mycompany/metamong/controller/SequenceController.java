package com.mycompany.metamong.controller;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.metamong.dto.Pager;
import com.mycompany.metamong.dto.applyList.ApplyListDto;
import com.mycompany.metamong.dto.sequence.ApplySequenceDto;
import com.mycompany.metamong.dto.sequence.SequenceApplyListDto;
import com.mycompany.metamong.dto.sequence.SequenceDto;
import com.mycompany.metamong.enums.SchemaEnum;
import com.mycompany.metamong.service.ApplyService;
import com.mycompany.metamong.service.SequenceService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/sequence")
public class SequenceController {

	@Autowired
	private SequenceService sequenceService;
	@Autowired
	private ApplyService applyService;

	@GetMapping("/sequenceList")
	public String sequenceList(Model model) {
		model.addAttribute("schemaEnum", SchemaEnum.values());

		List<SequenceDto> sequence = sequenceService.getSequenceList();
		model.addAttribute("sequence", sequence);

		return "dbObject/sequence/sequenceList";
	}

	@ResponseBody
	@GetMapping("/searchSequence")
	public List<SequenceDto> searchSequence(@RequestParam(defaultValue = "ALL") String schema,
			@RequestParam(defaultValue = "NULL") String keyword) {
		log.info(keyword);
		List<SequenceDto> sequence = sequenceService.getSearchSequence(schema, keyword);
		log.info(sequence.toString());
		return sequence;
	}

	@PostMapping("/applySequence")
	public ResponseEntity<String> applySequence(@RequestParam("sequenceName") String sequenceName,
			@RequestParam("schemaName") String schemaName,@RequestParam("Type")String Type, @RequestParam("applyReason") String applyReason,
			@RequestPart("file") MultipartFile file,Authentication auth) throws IOException {
		
		//신청내역 테이블 insert
		ApplyListDto applyList = new ApplyListDto();
		applyList.setMId(auth.getName());
		applyList.setApplyReason(applyReason);
		applyList.setSchemaName(schemaName);
		applyList.setApplyObj("SEQUENCE");
		String fileContent = new String(file.getBytes(), StandardCharsets.UTF_8);
		applyList.setQuery(fileContent);
		applyList.setApplyType(Type);
		
		applyService.applySequence(applyList);
		
		//신청내역시퀀스 insert
		ApplySequenceDto applySequence = new ApplySequenceDto();
		applySequence.setApplyNo(applyList.getApplyNo());
		applySequence.setSeqName(sequenceName);
		applySequence.setSeqFileName(file.getOriginalFilename());
		applySequence.setSeqFileType(file.getContentType());     
		applySequence.setSeqFileData(file.getBytes());      
		
		sequenceService.insertApplySequence(applySequence);
		

		return ResponseEntity.ok("/Metamong/sequence/sequenceApplyList");
	}

	
	@GetMapping("/sequenceApplyList")
	public String sequenceApplyList(@RequestParam(defaultValue = "1") int pageNo, HttpSession session, Model model) {
		int totalRows = applyService.getTotalSequenceRows();

		Pager pager = new Pager(10, 5, totalRows, pageNo);
		session.setAttribute("pager", pager);
		
		List<SequenceApplyListDto> list = applyService.getsequenceApplyList(pager);
		model.addAttribute("list", list);
		model.addAttribute("schemaEnum", SchemaEnum.values());
		return "dbObject/sequence/sequenceApplyList";
	}

	@GetMapping("/sequenceApplyDetail")
	public String sequenceApplyDetail() {
		return "dbObject/sequence/sequenceApplyDetail";
	}

}
