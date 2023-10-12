package com.bringbring.notice.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bringbring.notice.domain.Notice;
import com.bringbring.notice.domain.PageInfo;
import com.bringbring.notice.service.NoticeService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/notice")
@RequiredArgsConstructor
public class NoticeController {

	private final NoticeService noticeService;
	
	@GetMapping("/insert.do")
	public String showInsertInsert() {
		return "notice/insert";
	}
	
	@PostMapping("/insert.do")
	public String insertNotice(
			@Valid @ModelAttribute Notice notice
			, @RequestParam(value="uploadFile") MultipartFile uploadFile
			, HttpSession session
			, HttpServletRequest request
			, Model model) {
		String adminNo = (String) session.getAttribute("adminNo");
		if (adminNo != null && !adminNo.equals("")) {
//			notice.setAdminNo(adminNo);
//			if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
//				Map<String, Object> noticeMap = this.saveFile(request, uploadFile);
//				notice.setFilename((String)noticeMap.get("fileName"));
//				notice.setFileRename((String)noticeMap.get("fileReName"));
//				notice.setFilePath((String)noticeMap.get("filePath"));
//				notice.setFileLength((long)noticeMap.get("fileLength"));
//			}
			int result = noticeService.insertNotice(notice);
			if(result > 0) {
				return "redirect:/notice/list.do";
			}
			return "redirect:/notice/list.do";
		} else {
			model.addAttribute("msg", "공지사항이 등록되지 않았습니다.");
			model.addAttribute("error", "공지사항 등록 실패");
			model.addAttribute("url", "/notice/register.do");
			return "redirect:/notice/list.do";
		}
	}
	
	@GetMapping("/list.do")
	public String showNoticeList(
			@RequestParam(value="page", required = false, defaultValue = "1") Integer currentPage
			, Model model) {
		Integer totalCount = noticeService.getListCount();
		PageInfo noticeInfo = this.getPageInfo(currentPage, totalCount);
		List<Notice> noticeList = noticeService.selectNoticeList(noticeInfo);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("noticeInfo", noticeInfo);
		return "redirect:/notice/list.do";
	}
	
	private PageInfo getPageInfo(Integer currentPage, int totalCount) {
		int recordCountPerPage = 10;
		int naviCountPerPage = 10;
		int naviTotalCount;
		naviTotalCount = (int)Math.ceil((double)totalCount/recordCountPerPage);
		
		int startNavi = ((int)((double)currentPage/naviCountPerPage+0.9)-1)*recordCountPerPage+1;
		int endNavi = startNavi + naviCountPerPage - 1;
		if(endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		PageInfo noticeInfo = new PageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage, startNavi, endNavi);
		return noticeInfo;
	}

	@GetMapping("/detail.do")
	public String showNoticeDetail(
			@RequestParam("noticeNo") Integer noticeNo
			, Model model) {
		Notice selectOne = noticeService.selectNoticeByNo(noticeNo);
		model.addAttribute("notice", selectOne);
		return "redirect:/notice/detail";
	}
	
	
}
