package com.bringbring.mypage.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bringbring.inquire.domain.Inquire;
import com.bringbring.inquire.service.InquireService;
import com.bringbring.mypage.service.MypageService;
import com.bringbring.reservation.domain.ReservationComplete;
import com.bringbring.user.domain.User;
import com.bringbring.user.service.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/mypage")
public class MypageController {
	
	private final InquireService inquireService;
	private final UserService userService;
	private final MypageService mypageService;
	
	// 마이페이지 메인
	@GetMapping("/main.do")
	public String showMypageMain(
			HttpSession session
			, Model model) throws Exception {
		
		// 유저 정보가져옴
		String userId = (String)session.getAttribute("sessionId");
		User userOne = userService.selectOneById(userId);
		
		int userNo = userOne.getUserNo();
		// 신청 내역 가져옴
		List<ReservationComplete> reservationInfo = mypageService.selectReservationByuserNo(userNo);
		// 문의 내역 가져옴
		List<Inquire> inquireList = inquireService.selectInquireListByUserNo(userNo);
		
		// reservationInfo를 JSON으로 변환
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd"));
		String reservationInfoJSON = objectMapper.writeValueAsString(reservationInfo);
		
		model.addAttribute("inquireList", inquireList);
		model.addAttribute("reservationInfo", reservationInfo);
		model.addAttribute("reservationInfoAsJson", reservationInfoJSON);
		model.addAttribute("userOne", userOne);
		return "mypage/main";
	}
	
	// 신청내역 탭으로 이동
	@GetMapping("/enroll.do")
	public String showMypageEnroll(HttpSession session
			, Model model) throws Exception {
		// 유저 정보가져옴
		String userId = (String)session.getAttribute("sessionId");
		User userOne = userService.selectOneById(userId);
		
		int userNo = userOne.getUserNo();
		// 신청 내역 가져옴
		List<ReservationComplete> reservationInfo = mypageService.selectReservationByuserNo(userNo);
		
		// reservationInfo를 JSON으로 변환
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd"));
		String reservationInfoJSON = objectMapper.writeValueAsString(reservationInfo);
		
		model.addAttribute("reservationInfo", reservationInfo);
		model.addAttribute("reservationInfoAsJson", reservationInfoJSON);
		model.addAttribute("userOne", userOne);
				
		return "mypage/enroll";
	}
	
	// 문의내역 탭으로 이동
		@GetMapping("/inquire.do")
		public String showMypageInquire() {
			
			return "mypage/inquire";
		}
	
}
