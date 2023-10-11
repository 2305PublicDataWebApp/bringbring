package com.bringbring.config.divide.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bringbring.config.divide.service.DivideService;
import com.bringbring.reservation.domain.WasteCategory;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/divide")
@RequiredArgsConstructor
public class DivideController {

	private final DivideService divideService;
	
	@GetMapping("/insert.do")
	public ModelAndView goInsertPage(ModelAndView mv) {
		List<WasteCategory> wList = divideService.selectWasteCategoryList();
		mv.addObject("wList", wList);
		mv.setViewName("divide/insert");
		return mv;
	}
	
	@GetMapping("/detail.do")
	public ModelAndView goDetailPage(ModelAndView mv) {
		mv.setViewName("divide/detail");
		return mv;
	}
	
	
}

