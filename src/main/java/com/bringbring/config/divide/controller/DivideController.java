package com.bringbring.config.divide.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bringbring.config.divide.service.DivideService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/divide")
public class DivideController {

	private DivideService dService;
	
	@GetMapping("/insert.do")
	public ModelAndView goInsertPage(ModelAndView mv) {
		mv.setViewName("divide/insert");
		return mv;
	}
	
	@GetMapping("/detail.do")
	public ModelAndView goDetailPage(ModelAndView mv) {
		mv.setViewName("divide/detail");
		return mv;
	}
	
	
}

