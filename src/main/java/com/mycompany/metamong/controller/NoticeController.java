package com.mycompany.metamong.controller;

import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CORBA_2_3.portable.OutputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.metamong.dto.AddNoticeForm;
import com.mycompany.metamong.dto.NoticeDto;
import com.mycompany.metamong.dto.Pager;
import com.mycompany.metamong.service.NoticeService;

import lombok.extern.slf4j.Slf4j;

@Controller	
@Slf4j
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/noticeAddForm")
	public String noticeAddForm() {	
		return "notice/noticeAddForm";
	}
	
	@PostMapping("/addNotice")
	public String addNotice(AddNoticeForm form) throws Exception{
		NoticeDto notice = new NoticeDto();
		notice.setNoticeTitle(form.getNoticeTitle());
		notice.setNoticeContent(form.getNoticeContent());
		notice.setNoticeRegdate(form.getNoticeRegdate());
		
		MultipartFile noticeFile = form.getNoticeFile();
		if(!noticeFile.isEmpty()) {
			notice.setNoticeFilename(noticeFile.getOriginalFilename());
			notice.setNoticeFiletype(noticeFile.getContentType());
			notice.setNoticeFiledata(noticeFile.getBytes());
		}
		noticeService.addNotice(notice);
		return "redirect:/notice/noticeList";
	}
	
	@GetMapping("/noticeList")
	public String noticeList(Model model,@RequestParam(defaultValue="1")int pageNo,
			HttpSession session) {
		int totalRows = noticeService.getTotalRows();
		Pager pager = new Pager(10,5,totalRows,pageNo);
		session.setAttribute("pager", pager);
		
		List<NoticeDto> list = noticeService.getNoticeList(pager);
		model.addAttribute("list",list);
		
		return "notice/noticeList";
	}
	
	@GetMapping("/noticeDetail")
	public String noticeDetail(int noticeId, Model model) {
		NoticeDto notice = noticeService.getNotice(noticeId);
		model.addAttribute("notice", notice);
		return "notice/noticeDetail";
	}

	@GetMapping("/addHitCount")
	public String addHitCount(int noticeId, Model model) {
		noticeService.addHitcount(noticeId);
		return noticeDetail(noticeId,model);	
	}
	
	@GetMapping("/fileDownload")
	public void fileDownload(int noticeId, HttpServletResponse response)throws Exception {
		NoticeDto notice = noticeService.getNoticeFile(noticeId);
		String contentType = notice.getNoticeFiletype();
		response.setContentType(contentType);
		
		String fileName = notice.getNoticeFilename();
		String encodingFileName = new String(fileName.getBytes("UTF-8"),"ISO-8859-1");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + encodingFileName + "\"");
		
		ServletOutputStream out = response.getOutputStream();
		out.write(notice.getNoticeFiledata());
		out.flush();
		out.close();
	}
	
}
