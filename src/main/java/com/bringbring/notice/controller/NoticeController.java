package com.bringbring.notice.controller;

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
import com.bringbring.notice.service.NoticeService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/notice")
@RequiredArgsConstructor
public class NoticeController {

	private final NoticeService noticeService;
	
	@GetMapping("/insert.do")
	public String showInsertForm() {
		return "notice/insert";
	}
	
	@PostMapping("/insert.do")
	public String insertNotice(
			@Valid @ModelAttribute Notice notice
			, @RequestParam(value="uploadFile") MultipartFile uploadFile
			, HttpSession session
			, HttpServletRequest request
			, Model model) {
		String adminId = (String) session.getAttribute("adminId");
		if (adminId != null && !adminId.equals("")) {
			/*notice.setAdminId(adminId);*/
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
}
