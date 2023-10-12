package com.bringbring.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bringbring.mypage.service.MypageService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/mypage")
public class MypageController {
	
	private final MypageService mypageService;
	
	// 마이페이지 메인
	@GetMapping("/main.do")
	public String showMypageMain() {
		return "mypage/main";
	}
	
}
