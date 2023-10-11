package com.bringbring.divide.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bringbring.divide.domain.Divide;
import com.bringbring.divide.service.DivideService;
import com.bringbring.reservation.domain.WasteCategory;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/divide")
@RequiredArgsConstructor
public class DivideController {

	private final DivideService divideService;
	
	@GetMapping("/insert.do")
	public ModelAndView showDivideInsert(ModelAndView mv) {
		List<WasteCategory> wList = divideService.selectWasteCategoryList();
		mv.addObject("wList", wList);
		mv.setViewName("divide/insert");
		return mv;
	}
	
	@PostMapping("/insert.do")
	public ModelAndView insertDivide(ModelAndView mv
			, Divide divide
			, @RequestParam (value="uploadFiles", required = false) MultipartFile[] uploadFiles
			, HttpServletRequest request
			, HttpSession session) {
		
		String userId = (String)session.getAttribute("userId");
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
	
	
}

