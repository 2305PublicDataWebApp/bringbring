package com.bringbring.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class AdminController {

//	문의 관리	
	@GetMapping("/contactM.do")
	public ModelAndView showContactManagement(ModelAndView mv) {
		mv.setViewName("admin/contactManagement");
		return mv;
	}
	
// 관할지역 예약조회	
	@GetMapping("/localM.do")
	public ModelAndView showLocalReservationManagement(ModelAndView mv) {
		mv.setViewName("admin/localReservationManagement");
		return mv;
	}
	
//	회원 관리
	@GetMapping("/memberM.do")
	public ModelAndView showMemberManagement(ModelAndView mv) {
		mv.setViewName("admin/memberManagement");
		return mv;
	}
	
	@PostMapping("/memberM.do")
	public ModelAndView userListManagement(ModelAndView mv
			,@RequestParam(value="page", required=false, defaultValue="1") Integer currentPage) {
		return mv;
	}
	
//	신고 관리
	@GetMapping("/reportM.do")
	public ModelAndView showReportManagement(ModelAndView mv) {
		mv.setViewName("admin/reportManagement");
		return mv;
	}
	
//	예약 상세 조회
	@GetMapping("/rDetail.do")
	public ModelAndView showReservationDetail(ModelAndView mv) {
		mv.setViewName("admin/reservationDetail");
		return mv;
	}
	
//	예약 조회
	@GetMapping("/reservationM.do")
	public ModelAndView showReservationManagement(ModelAndView mv) {
		mv.setViewName("admin/reservationManagement");
		return mv;
	}
}
