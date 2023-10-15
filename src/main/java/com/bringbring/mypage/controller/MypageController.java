package com.bringbring.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bringbring.mypage.service.MypageService;
import com.bringbring.user.domain.User;
import com.bringbring.user.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/mypage")
public class MypageController {
	
	private final MypageService mypageService;
	private final UserService userService;
	
	// 마이페이지 메인
	@GetMapping("/main.do")
	public String showMypageMain(
			HttpSession session
			, Model model) {
		
		String userId = (String)session.getAttribute("sessionId");
		User userOne = userService.selectOneById(userId);
		if(userOne != null) {
			model.addAttribute("userOne", userOne);
			return "mypage/main";
		}else {
			//실패하면 에러페이지로 이동
			model.addAttribute("msg", "정보를 찾을 수 없습니다.");
			model.addAttribute("error", "회원정보 가져오기 실패");
			model.addAttribute("url", "/");
			return "common/error";
		}
	}
	
	
}
