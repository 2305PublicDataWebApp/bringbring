package com.bringbring.divide.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.bringbring.common.PageInfo;
import com.bringbring.divide.domain.*;
import com.bringbring.image.domain.Image;
import com.bringbring.mypage.service.MypageService;
import com.bringbring.reservation.service.ReservationService;
import com.bringbring.user.domain.User;
import com.bringbring.user.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bringbring.divide.service.DivideService;
import com.bringbring.region.domain.City;
import com.bringbring.region.service.RegionService;
import com.bringbring.reservation.domain.WasteCategory;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/divide")
@RequiredArgsConstructor
public class DivideController {

	private final DivideService divideService;
	private final RegionService regionService;
	private final ReservationService reservationService;
	private final UserService userService;
	private  final MypageService mypageService;

	@GetMapping("/insert.do")
	public String showDivideInsert(Model model) {
		List<WasteCategory> wasteCategories = reservationService.selectWasteCategoryList();
		List<City> cityList = regionService.selectCityList();
		model.addAttribute("wList", wasteCategories).addAttribute("cList", cityList);
		return "divide/insert";
	}
	
	@PostMapping("/insert.do")
    public String insertDivide(Divide divide
			, @RequestParam (value="uploadFiles", required = false) MultipartFile[] uploadFiles
			, HttpServletRequest request
			, HttpSession httpSession) {

		String userId = (String)httpSession.getAttribute("sessionId");
		User user = userService.selectOneById(userId);
		divide.setUserNo(user.getUserNo());
		System.out.println(divide);
		int result = divideService.insertDivide(divide, uploadFiles, request);
		if(result > 0) {
			int max = divideService.selectMaxNo();
			return "redirect:/divide/detail.do?divNo=" + max;
		}else {
			return "/";
		}
	}
	
	@GetMapping("/detail.do")
	public String showDivideDetail(Model model
			, int divNo
			, HttpSession httpSession) {

		List<Image> imageList = divideService.selectImageListByNo(divNo);
		DetailData detailData = divideService.selectDetailDataByNo(divNo);
		Map<String, Object> map = new HashMap<String, Object>();
		String userId = (String)httpSession.getAttribute("sessionId");
		if (userId != null && !userId.isEmpty()) {
			map.put("sessionId", userId);
			map.put("divNo", divNo);
			Heart heart = divideService.selectHeartByMap(map);
			model.addAttribute("heart", heart);
		}
		model.addAttribute("iList", imageList).addAttribute("dData", detailData);
		return "divide/detail";
	}

	@GetMapping("/update.do")
	public String showDivideUpdate(Model model
			, int divNo) {

		List<WasteCategory> wasteCategories = reservationService.selectWasteCategoryList();
		List<Image> imageList = divideService.selectImageListByNo(divNo);
		if(!imageList.isEmpty()){
			model.addAttribute("iList", imageList);
		}
		List<City> cityList = regionService.selectCityList();
		UpdateData updateData = divideService.selectUpdateDataByNo(divNo);

		model.addAttribute("wList", wasteCategories).addAttribute("cList", cityList);
		model.addAttribute("uData", updateData);
		return "divide/update";
	}

	@PostMapping("/update.do")
	public String updateDivide(Divide divide
			, @RequestParam (value="uploadFiles", required = false) MultipartFile[] uploadFiles
			, @RequestParam (value="deletePreImageNo", required = false) int[] deletePreImageNo
			, HttpServletRequest request) {

		int result = divideService.updateDivide(divide, uploadFiles, deletePreImageNo, request);
		if(result > 0){
			return "redirect:/divide/detail.do?divNo="+divide.getDivNo();
		}else{
			return "/";
		}

	}

	@GetMapping("/delete.do")
	public String deleteDivide(int divNo) { divideService.deleteDivide(divNo); return "redirect:/divide/list.do"; }

	@GetMapping("/list.do")
	public String showDivideList(Model model
			, @RequestParam(value= "page", required = false, defaultValue="1") Integer currentPage
			, @RequestParam(value= "searchOption", required = false, defaultValue="date") String searchOption
			, HttpSession httpSession) {

		String userId = (String) httpSession.getAttribute("sessionId");
		int totalCount = divideService.getListCount();
		PageInfo pInfo = divideService.getPageInfo(currentPage, totalCount);

		if (userId != null && !userId.isEmpty()) {
			User user = userService.selectOneById(userId);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userNo", user.getUserNo());
			map.put("searchOption", searchOption);
			List<ResponseData> responseData = divideService.selectLoginResponseDataList(pInfo, map);
			model.addAttribute("cUserNo", user.getUserNo()).addAttribute("rData", responseData);
		}else{
			List<ResponseData> responseData = divideService.selectResponseDataList(pInfo, searchOption);
			model.addAttribute("rData", responseData);
		}

		model.addAttribute("pInfo", pInfo).addAttribute("searchOption", searchOption);

		return "divide/list";
	}

	@GetMapping("/search.do")
	public String searchDivideList(
			@RequestParam(value="searchCondition") String searchCondition
			, @RequestParam(value="searchKeyword") String searchKeyword
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
			, @RequestParam(value= "searchOption", required = false, defaultValue="date") String searchOption
			, HttpSession httpSession
			, Model model){

		String userId = (String) httpSession.getAttribute("sessionId");
		int totalCount = 0;
		PageInfo pInfo = null;
		Map<String, Object> map = null;
		if (userId != null && !userId.isEmpty()) {
			User user = userService.selectOneById(userId);
			map = new HashMap<String, Object>();
			map.put("userNo", user.getUserNo());
			map.put("searchOption", searchOption);
			map.put("searchCondition", searchCondition);
			map.put("searchKeyword", searchKeyword);
			totalCount = divideService.getSearchListCount(map);
			pInfo = divideService.getPageInfo(currentPage, totalCount);
			List<ResponseData> responseData = divideService.selectLoginResponseDataSearchList(pInfo, map);
			model.addAttribute("cUserNo", user.getUserNo()).addAttribute("rData", responseData);
		}else{
			map = new HashMap<String, Object>();
			map.put("searchOption", searchOption);
			map.put("searchCondition", searchCondition);
			map.put("searchKeyword", searchKeyword);
			totalCount = divideService.getSearchListCount(map);
			pInfo = divideService.getPageInfo(currentPage, totalCount);
			List<ResponseData> responseData = divideService.selectResponseDataSearchList(pInfo, map);
			model.addAttribute("rData", responseData);
		}

		model.addAttribute("pInfo", pInfo).addAttribute("map", map);

		return "divide/search";
	}

	@GetMapping("/divideYn.do")
	public String updateDivideYn(int divNo){
		mypageService.updateDivideYn(divNo);
		return "redirect:/divide/detail.do?divNo="+divNo;
	}


}

