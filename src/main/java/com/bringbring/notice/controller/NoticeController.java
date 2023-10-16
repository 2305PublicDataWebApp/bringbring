package com.bringbring.notice.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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

import com.bringbring.common.PageInfo;
import com.bringbring.notice.domain.Notice;
import com.bringbring.notice.service.NoticeService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/notice")
@RequiredArgsConstructor
public class NoticeController {

	private final NoticeService noticeService;

	@GetMapping("/insert.do")
	public String showNoticeInsert() {
		return "notice/insert";
	}

	@PostMapping("/insert.do")
	public String insertNotice(@Valid @ModelAttribute Notice notice,
			@RequestParam(value = "uploadFile") MultipartFile uploadFile, HttpSession session,
			HttpServletRequest request, Model model) {
		Integer sessionAdminNo = (Integer) session.getAttribute("adminNo");
		if (sessionAdminNo != null && !sessionAdminNo.equals("")) {
			notice.setAdminNo(sessionAdminNo);
			int result = noticeService.insertNotice(notice);
			if (result > 0) {
				return "redirect:/notice/list.do";
			}
			return "redirect:/notice/list.do";
		} else {
			model.addAttribute("msg", "공지사항이 등록되지 않았습니다.");
			model.addAttribute("error", "공지사항 등록 실패");
			model.addAttribute("url", "/notice/insert.do");
			return "common/error";
		}
	}

	@GetMapping("/list.do")
	public String showNoticeList(
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage, Model model) {
		Integer totalCount = noticeService.getListCount();
		PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
		List<Notice> noticeList = noticeService.selectNoticeList(pInfo);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pInfo", pInfo);
		return "notice/list";
	}

	private PageInfo getPageInfo(Integer currentPage, Integer totalCount) {
		int recordCountPerPage = 10;
		int naviCountPerPage = 10;
		int naviTotalCount;
		naviTotalCount = (int) Math.ceil((double) totalCount / recordCountPerPage);

		int startNavi = ((int) ((double) currentPage / naviCountPerPage + 0.9) - 1) * recordCountPerPage + 1;
		int endNavi = startNavi + naviCountPerPage - 1;
		if (endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		return new PageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage, startNavi,
				endNavi);
	}

	@GetMapping("/detail.do")
	public String showNoticeDetail(@RequestParam("noticeNo") Integer noticeNo, Model model) {
		Notice selectOne = noticeService.selectNoticeByNo(noticeNo);
		model.addAttribute("notice", selectOne);
		return "notice/detail";
	}

	@GetMapping("/delete.do")
	public String deleteNotice(Model model, @ModelAttribute Notice notice, HttpSession session) {
		Integer sessionAdminNo = (Integer) session.getAttribute("adminNo");
		Integer noticeAdminNo = notice.getAdminNo();
		if (sessionAdminNo != null && noticeAdminNo != null && sessionAdminNo.equals(noticeAdminNo)) {
			int result = noticeService.deleteNotice(notice);
			if (result > 0) {
				return "redirect:/notice/list.do";
			} else {
				model.addAttribute("msg", "게시글 삭제에 실패하였습니다.");
				model.addAttribute("error", "게시글 삭제 실패");
				model.addAttribute("url", "/notice/list.do");
				return "common/error";
			}
		} else {
			model.addAttribute("msg", "권한이 없습니다.");
			model.addAttribute("msg", "게시글 삭제 불가");
			model.addAttribute("url", "/notice/list.do");
			return "common/error";
		}
	}

	@GetMapping("/update.do")
	public String showNoticeUpdate(@RequestParam("noticeNo") Integer noticeNo, @ModelAttribute Notice notice,
			Model model) {
		notice = noticeService.selectNoticeByNo(noticeNo);
		model.addAttribute("notice", notice);
		return "notice/update";
	}

	@PostMapping("/update.do")
	public String updateNotice(@ModelAttribute Notice notice,
			@RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile, Model model,
			HttpSession session, HttpServletRequest request) {
		Integer adminNo = (Integer) session.getAttribute("adminNo");
		if (adminNo != null && !adminNo.equals("")) {
			int result = noticeService.updateNotice(notice);
			if (result > 0) {
				return "redirect:/notice/detail.do?noticeNo=" + notice.getNoticeNo();
			} else {
				model.addAttribute("msg", "게시글 수정에 실패하였습니다.");
				model.addAttribute("error", "게시글 수정 실패");
				model.addAttribute("url", "/notice/detail.do?noticeNo=" + notice.getNoticeNo());
				return "common/error";
			}
		} else {
			model.addAttribute("msg", "권한이 없습니다.");
			model.addAttribute("error", "게시글 수정 불가");
			model.addAttribute("url", "/notice/detail.do?noticeNo=" + notice.getNoticeNo());
			return "common/error";
		}
	}

}
