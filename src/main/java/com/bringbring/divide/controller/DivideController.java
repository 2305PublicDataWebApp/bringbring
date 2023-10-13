package com.bringbring.divide.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.bringbring.common.PageInfo;
import com.bringbring.region.domain.District;
import com.bringbring.reservation.service.ReservationService;
import com.bringbring.user.domain.User;
import com.bringbring.user.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bringbring.divide.domain.Divide;
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

	@GetMapping("/insert.do")
	public ModelAndView showDivideInsert(ModelAndView mv) {
		List<WasteCategory> wasteCategories = reservationService.selectWasteCategoryList();
		List<City> cList = regionService.selectCityList();
		mv.addObject("wList", wasteCategories).addObject("cList", cList);
		mv.setViewName("divide/insert");
		return mv;
	}
	
	@PostMapping("/insert.do")
    public ModelAndView insertDivide(ModelAndView mv
			, Divide divide
			, @RequestParam (value="uploadFiles", required = false) MultipartFile[] uploadFiles
			, HttpServletRequest request
			, HttpSession session) {

		String userId = (String)session.getAttribute("sessionId");
		User user = userService.selectOneById(userId);
		divide.setUserNo(user.getUserNo());
		System.out.println(divide);
		int result = divideService.insertDivide(divide, uploadFiles, request);
		if(result > 0) {
			mv.setViewName("divide/detail");
			return mv;
		}else {
			mv.setViewName("/");
			return mv;
		}
	}
	
	@GetMapping("/detail.do")
	public ModelAndView showDivideDetail(ModelAndView mv) {
		mv.setViewName("divide/detail");
		return mv;
	}

	@GetMapping("/list.do")
	public ModelAndView showDivideList(ModelAndView mv
			, @RequestParam(value= "page", required = false, defaultValue="1") Integer currentPage) {
		int totalCount = divideService.getListCount();
		PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
		List<Divide> divideList = divideService.selectDivideList(pInfo);
		mv.addObject("dList", divideList).addObject("pInfo", pInfo);
		mv.setViewName("divide/list");
		return mv;
	}

	public PageInfo getPageInfo(int currentPage, int totalCount) {

		PageInfo pi = null;
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		int naviTotalCount;
		int startNavi;
		int endNavi;

		naviTotalCount = (int)((double) totalCount / recordCountPerPage + 0.9);

		startNavi = (((int) ((double) currentPage / naviCountPerPage + 0.9)) - 1) * naviCountPerPage + 1;

		endNavi = startNavi + naviCountPerPage - 1;
		if (endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}

		pi = new PageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage,
		 startNavi, endNavi);
		return pi;
	}
}

