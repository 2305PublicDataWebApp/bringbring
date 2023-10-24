package com.bringbring.inquire.controller;


import com.bringbring.divide.domain.Divide;
import com.bringbring.inquire.domain.InquireUpdate;
import com.bringbring.inquire.service.InquireService;
import com.bringbring.user.service.UserService;
import com.bringbring.common.PageInfo;
import com.bringbring.divide.domain.ResponseData;
import com.bringbring.image.domain.Image;
import com.bringbring.inquire.domain.Inquire;
import com.bringbring.inquire.domain.InquireDetail;
import com.bringbring.region.domain.City;
import com.bringbring.region.service.RegionService;
import com.bringbring.reservation.domain.WasteCategory;
import com.bringbring.reservation.service.ReservationService;
import com.bringbring.user.domain.User;
import com.bringbring.user.service.UserService;
import lombok.Getter;
import org.springframework.stereotype.Controller;

import com.bringbring.inquire.service.InquireService;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/inquire")
public class InquireController {

	private final InquireService inquireService;
	private final UserService userService;
	private final RegionService regionService;

	@GetMapping("/insert.do")
	public String showInquireInsert(Model model){

		List<City> cityList = regionService.selectCityList();
		model.addAttribute("cList", cityList);
		return "inquire/insert";
	}

	@GetMapping("/list.do")
	public String showInquireList(Model model
			, @RequestParam(value= "page", required = false, defaultValue="1") Integer currentPage
			, HttpSession httpSession){

		User user = userService.selectOneById((String) httpSession.getAttribute("sessionId"));
		int totalCount = inquireService.getListCountByNo(user.getUserNo());
		PageInfo pInfo = inquireService.getPageInfo(currentPage, totalCount);
		List<Inquire> inquireList = inquireService.selectPageInquireListByNo(pInfo, user.getUserNo());
		if(!inquireList.isEmpty()){
			model.addAttribute("iList", inquireList);
		}
		model.addAttribute("user", user).addAttribute("pInfo", pInfo);
		return "mypage/inquire";
	}

	@PostMapping("/insert.do")
	public String insertInquire(Model model
			, @ModelAttribute Inquire inquire
			, @RequestParam(value="uploadFiles", required = false) MultipartFile[] uploadFiles
			, HttpServletRequest request
			, HttpSession httpSession) {

		String userId = (String)httpSession.getAttribute("sessionId");
		User user = userService.selectOneById(userId);
		inquire.setUserNo(user.getUserNo());
		int result = inquireService.insertInquire(inquire, uploadFiles, request );
		if(result > 0 ) {
			return "redirect:/inquire/list.do";
		} else {
			return "/";
		}
	}

	@GetMapping("/detail.do")
	public String showInquireDetail(Model model
			, int inqNo
			, HttpSession httpSession){
		Integer sessionUserGrade = (Integer) httpSession.getAttribute("sessionUserGrade");
		if (sessionUserGrade != null && sessionUserGrade > 1) {
			User admin = userService.selectOneById((String)httpSession.getAttribute("sessionId"));
			model.addAttribute("admin", admin);
		}
		InquireDetail inquireDetail = inquireService.selectInquireDetailByNo(inqNo);
		InquireDetail encodingDetail = inquireService.encodingDetail(inquireDetail);
		List<Image> imageList = inquireService.selectImageList(inqNo);

		model.addAttribute("inqDetail", encodingDetail).addAttribute("iList", imageList);
		return "inquire/detail";
	}

	@GetMapping("/update.do")
	public String showInquireUpdate(Model model,
			int inqNo) {

		List<Image> imageList = inquireService.selectImageList(inqNo);
		if(!imageList.isEmpty()){
			model.addAttribute("iList", imageList);
		}
		InquireUpdate inquireUpdate = inquireService.selectInquireUpdate(inqNo);
		List<City> cityList = regionService.selectCityList();
		model.addAttribute("cList", cityList).addAttribute("iData", inquireUpdate);

		return "inquire/update";
	}

	@PostMapping("/update.do")
	public String updateInquire(Inquire inquire
			, @RequestParam (value="uploadFiles", required = false) MultipartFile[] uploadFiles
			, @RequestParam (value="deletePreImageNo", required = false) int[] deletePreImageNo
			, HttpServletRequest request) {

		int result = inquireService.updateInquire(inquire, uploadFiles, deletePreImageNo, request);
		if(result > 0){
			return "redirect:/inquire/detail.do?inqNo="+inquire.getInqNo();
		}else{
			return "/";
		}
	}

	@GetMapping("/delete.do")
	public String deleteInquire(int inqNo) {
		inquireService.deleteInquire(inqNo);
		return "redirect:/inquire/list.do";
	}


}
