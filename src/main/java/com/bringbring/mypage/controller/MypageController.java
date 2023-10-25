package com.bringbring.mypage.controller;

import com.bringbring.chatting.domain.ChatData;
import com.bringbring.common.PageInfo;
import com.bringbring.divide.domain.DivideData;
import com.bringbring.divide.domain.HeartData;
import com.bringbring.divide.service.DivideService;
import com.bringbring.inquire.domain.Inquire;
import com.bringbring.inquire.service.InquireService;
import com.bringbring.mypage.service.MypageService;
import com.bringbring.reservation.domain.ReservationComplete;
import com.bringbring.reservation.service.ReservationService;
import com.bringbring.user.domain.User;
import com.bringbring.user.service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/mypage")
public class MypageController {
	
	private final InquireService inquireService;
	private final UserService userService;
	private final MypageService mypageService;
	private final DivideService divideService;
	private final ReservationService reservationService;
	
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
			, Model model, @RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage) throws Exception {
		// 유저 정보가져옴
		String userId = (String)session.getAttribute("sessionId");
		User userOne = userService.selectOneById(userId);
		
		int userNo = userOne.getUserNo();
		int totalCount = reservationService.selectReservationListCount(userNo);
		PageInfo pageInfo = reservationService.getPageInfo(currentPage, userNo, totalCount);
		// 신청 내역 가져옴
		List<ReservationComplete> reservationInfo = reservationService.selectMyReservationList(pageInfo, userNo);
		
		// reservationInfo를 JSON으로 변환
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd"));
		String reservationInfoJSON = objectMapper.writeValueAsString(reservationInfo);
		
		model.addAttribute("reservationInfo", reservationInfo);
		model.addAttribute("reservationInfoAsJson", reservationInfoJSON);
		model.addAttribute("userOne", userOne);
		model.addAttribute("pageInfo", pageInfo);
				
		return "mypage/enroll";
	}
	
	// 문의내역 탭으로 이동
		@GetMapping("/inquire.do")
		public String showMypageInquire() {
			
			return "mypage/inquire";
		}

	@GetMapping("/heart.do")
	public String showMypageHeart(Model model
			, @RequestParam(value= "page", required = false, defaultValue="1") Integer currentPage
			, HttpSession httpSession){

		User user = userService.selectOneById((String)httpSession.getAttribute("sessionId"));
		int totalCount = mypageService.getHeartListCountByNo(user.getUserNo());
		PageInfo pInfo = mypageService.getPageInfo(currentPage, totalCount);
		List<HeartData> heartData = mypageService.selectHeartList(pInfo, user.getUserNo());
		if(!heartData.isEmpty()){
			model.addAttribute("hData", heartData);
		}
		model.addAttribute("pInfo", pInfo).addAttribute("user", user);
		return "mypage/heart";
	}

	@GetMapping("/divide.do")
	public String showMypageDivide(Model model
			, @RequestParam(value= "page", required = false, defaultValue="1") Integer currentPage
			, HttpSession httpSession){

		User user = userService.selectOneById((String)httpSession.getAttribute("sessionId"));
		int totalCount = mypageService.getDivideListCountByNo(user.getUserNo());
		PageInfo pInfo = mypageService.getPageInfo(currentPage, totalCount);
		List<DivideData> divideData = mypageService.selectMypageDivideList(pInfo, user.getUserNo());
		if(!divideData.isEmpty()){
			model.addAttribute("dData", divideData);
		}
		model.addAttribute("pInfo", pInfo);
		return "mypage/divide";
	}

	@GetMapping("/divideYn.do")
	public String updateDivideYn(int divNo){
		mypageService.updateDivideYn(divNo);
		return "redirect:/mypage/divide.do";
	}

	@GetMapping("/chatting.do")
	public String showMypageChatting(Model model
			, @RequestParam(value= "page", required = false, defaultValue="1") Integer currentPage
			, HttpSession httpSession){

		User user = userService.selectOneById((String)httpSession.getAttribute("sessionId"));
		int totalCount = mypageService.getChatDataListCountByNo(user.getUserNo());
		PageInfo pInfo = mypageService.getPageInfo(currentPage, totalCount);
		List<ChatData> chatData = mypageService.selectMypageChatList(pInfo, user.getUserNo());
		if(!chatData.isEmpty()){
			model.addAttribute("cData", chatData);
		}
		model.addAttribute("pInfo", pInfo).addAttribute("user", user);
		return "mypage/chatting";
	}

}
