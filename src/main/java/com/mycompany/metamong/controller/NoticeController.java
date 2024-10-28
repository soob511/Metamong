package com.mycompany.metamong.controller;

import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.mycompany.metamong.dto.UpdateNoticeForm;
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
	
	@PostMapping("/insertNotice")
	public String insertNotice(AddNoticeForm form) throws Exception{
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
		noticeService.insertNotice(notice);
		return "redirect:/notice/noticeList";
	}
	
	@GetMapping("/noticeList")
	public String noticeList(Model model,@RequestParam(defaultValue="1")int pageNo,
			HttpSession session) {
		int totalRows = noticeService.getTotalRows();
		Pager pager = new Pager(10,5,totalRows,pageNo);
		session.setAttribute("pager", pager);
		model.addAttribute("totalRows", totalRows);
		List<NoticeDto> list = noticeService.getNoticeList(pager);
		model.addAttribute("list",list);
		
		return "notice/noticeList";
	}
	
	@GetMapping("/noticeDetail")
	public String noticeDetail(int noticeId, Model model) {
		NoticeDto notice = noticeService.getNotice(noticeId);
		noticeService.addHitcount(noticeId);
		model.addAttribute("notice", notice);
		
		NoticeDto prevNotice = noticeService.getPrevNotice(noticeId);
		NoticeDto nextNotice = noticeService.getNextNotice(noticeId);
		
		model.addAttribute("prevNotice", prevNotice);
		model.addAttribute("nextNotice", nextNotice);
		
		
		return "notice/noticeDetail";
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
	@GetMapping("/noticeUpdateForm")
	public String noticeUpdateForm(int noticeId, Model model) {
		NoticeDto notice = noticeService.getNotice(noticeId);
		model.addAttribute("notice", notice);
		return "notice/noticeUpdateForm";
	}
	
	@PostMapping("/updateNotice")
	public String updateNotice(UpdateNoticeForm form) throws Exception {
		NoticeDto notice = new NoticeDto();
		notice.setNoticeId(form.getNoticeId());
		notice.setNoticeTitle(form.getNoticeTitle());
		notice.setNoticeRegdate(form.getNoticeRegdate());
		notice.setNoticeContent(form.getNoticeContent());
		MultipartFile mf = form.getNoticeFile();
		if(!mf.isEmpty()) {
			notice.setNoticeFilename(mf.getOriginalFilename());
			notice.setNoticeFiletype(mf.getContentType());
			notice.setNoticeFiledata(mf.getBytes());
		}
		noticeService.updateNotice(notice);
		return "redirect:/notice/noticeDetail?noticeId=" + form.getNoticeId();
	}
	@GetMapping("/deleteNotice")
	public String deleteNotice(int noticeId, HttpSession session) {
		noticeService.deleteNotice(noticeId);
		Pager pager = (Pager) session.getAttribute("pager");
		int pageNo = pager.getPageNo();
		return "redirect:/notice/noticeList?pageNo=" + pageNo;
	}
	@GetMapping("/notice/search")
	    public String search(@RequestParam("keyword") String keyword, Model model) {
	        // 검색 결과 리스트 가져오기
	        List<NoticeDto> searchResults = noticeService.searchNoticesByTitle(keyword);
	        model.addAttribute("list", searchResults);
	        model.addAttribute("totalRows", searchResults.size());
	        return "notice/noticeList";
	    }
	}

