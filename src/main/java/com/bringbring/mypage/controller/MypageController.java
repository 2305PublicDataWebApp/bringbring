package com.bringbring.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bringbring.inquire.domain.Inquire;
import com.bringbring.inquire.service.InquireService;
import com.bringbring.user.domain.User;
import com.bringbring.user.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/mypage")
public class MypageController {
	
	private final InquireService inquireService;
	private final UserService userService;
	
	// 마이페이지 메인
	@GetMapping("/main.do")
	public String showMypageMain(
			HttpSession session
			, Model model) {
		
		// 유저 정보가져옴
		String userId = (String)session.getAttribute("sessionId");
		User userOne = userService.selectOneById(userId);
		
		int userNo = userOne.getUserNo();
		List<Inquire> inquireList = inquireService.selectInquireListByUserNo(userNo);
		
		if(userOne != null && inquireList != null) {
			// 문의 내역 가져옴
			model.addAttribute("inquireList", inquireList);
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
	
	// 신청내역 탭으로 이동
	@GetMapping("/enroll.do")
	public String showMypageEnroll() {
		
		return "mypage/enroll";
	}
	
	// 문의내역 탭으로 이동
		@GetMapping("/inquire.do")
		public String showMypageInquire() {
			
			return "mypage/inquire";
		}
	
}
