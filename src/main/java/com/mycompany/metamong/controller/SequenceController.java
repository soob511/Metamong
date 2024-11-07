package com.mycompany.metamong.controller;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;

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

import com.mycompany.metamong.dto.applyList.ApplyListDto;
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
		log.info("실행");
		ApplyListDto applyList = new ApplyListDto();
		applyList.setMId(auth.getName());
		applyList.setApplyReason(applyReason);
		applyList.setSchemaName(schemaName);
		applyList.setApplyObj("schemaName");
		String fileContent = new String(file.getBytes(), StandardCharsets.UTF_8);
		applyList.setQuery(fileContent);
		applyList.setApplyType(Type);
		applyService.applySequence(applyList);

		return ResponseEntity.ok("/Metamong/sequence/sequenceApplyList");
	}

	
	@GetMapping("/sequenceApplyList")
	public String sequenceApplyList() {
		return "dbObject/sequence/sequenceApplyList";
	}

	@GetMapping("/sequenceApplyDetail")
	public String sequenceApplyDetail() {
		return "dbObject/sequence/sequenceApplyDetail";
	}

}
