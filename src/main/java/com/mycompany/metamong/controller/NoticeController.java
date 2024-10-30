package com.mycompany.metamong.controller;

import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.metamong.dto.Pager;
import com.mycompany.metamong.dto.notice.NoticeAddForm;
import com.mycompany.metamong.dto.notice.NoticeDto;
import com.mycompany.metamong.service.NoticeService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired 
	private NoticeService noticeService;
	
	@GetMapping("/noticeList")
	public String noticeList(Model model, @RequestParam(defaultValue="1")int pageNo, HttpSession session) {
		
		int totalRows = noticeService.getTotalRows();
		Pager pager = new Pager(10,5,totalRows,pageNo);
		
		session.setAttribute("pager", pager);
		model.addAttribute("totalRows", totalRows);
		
		List<NoticeDto> list = noticeService.getNoticeList(pager);
		model.addAttribute("list", list);
		
		return "notice/noticeList";
	}	
	
	@GetMapping("/noticeDetail")
	public String noticeDetail(int noticeId, Model model) {
		
		NoticeDto notice = noticeService.getNoticeDetail(noticeId);
		model.addAttribute("notice", notice);
		
		noticeService.addHitcount(noticeId);
		
		NoticeDto prevNotice = noticeService.getPrevNotice(noticeId);
		NoticeDto nextNotice = noticeService.getNextNotice(noticeId);
		
		model.addAttribute("prevNotice", prevNotice);
		model.addAttribute("nextNotice", nextNotice);
		
		return "notice/noticeDetail";
	}
	
	@GetMapping("/fileDownload")
	public void fileDownload(int noticeId, HttpServletResponse response) throws Exception{
		NoticeDto notice = noticeService.getNoticeFile(noticeId);
		
		String contentType = notice.getNoticeFiletype();
		response.setContentType(contentType);
		
		String fileName = notice.getNoticeFilename();
		String encodingName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + encodingName + "\"");
		
		ServletOutputStream os = response.getOutputStream();
		os.write(notice.getNoticeFiledata());
		os.flush();
		os.close();
		}
	
	@GetMapping("/noticeAddForm")
	public String noticeAddForm() {
		return "notice/noticeAddForm";
	}
	
	@ResponseBody
	@PostMapping("/insertNotice")
	public int insertNotice(NoticeAddForm form) throws Exception {
		NoticeDto notice = new NoticeDto();
		
		notice.setNoticeTitle(form.getNoticeTitle());
		notice.setNoticeContent(form.getNoticeContent());
		notice.setNoticeRegdate(form.getNoticeRegdate());

		MultipartFile noticeFile = form.getNoticeFile();
		if(noticeFile!=null && !noticeFile.isEmpty()) {
			notice.setNoticeFilename(noticeFile.getOriginalFilename());
			notice.setNoticeFiletype(noticeFile.getContentType());
			notice.setNoticeFiledata(noticeFile.getBytes());
		}
		
		return noticeService.insertNotice(notice);	
	}
}
