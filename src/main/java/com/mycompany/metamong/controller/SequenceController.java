package com.mycompany.metamong.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.metamong.dto.sequence.SequenceDto;
import com.mycompany.metamong.enums.SchemaEnum;
import com.mycompany.metamong.service.SequenceService;

@Controller
@RequestMapping("/sequence")
public class SequenceController {
	
	@Autowired
	private SequenceService sequenceService;
	
	@GetMapping("/sequenceList")
	public String sequenceList(Model model) {
		model.addAttribute("schemaEnum", SchemaEnum.values());
		
		List<SequenceDto> sequence = sequenceService.getSequenceList();
		model.addAttribute("sequence", sequence);
		
		return "dbObject/sequence/sequenceList";
	}
	
	@GetMapping("/searchSequnce")
	public String searchSequnce(@RequestParam(defaultValue="ALL") String schema,@RequestParam(defaultValue="NULL") String keyword) {
		
		return null;
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
