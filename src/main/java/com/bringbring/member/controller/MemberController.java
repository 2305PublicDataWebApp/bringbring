package com.bringbring.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bringbring.member.domain.Member;
import com.bringbring.member.service.MemberService;


@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	
	@GetMapping("/member/insert.do")
	public String showRegisterform() {
		return "member/test";
	}
	
	
	@PostMapping("/member/insert.do")
	public String registerMember(
			@Valid @ModelAttribute Member member
			, Model model) {

//			String str = null;
//			int length = str.length();
//			System.out.println("NullPointerException 발생!");
//			return "redirect:/";
			
			int result = service.insertMember(member);
			if(result>0) {
				//성공하면 로그인페이지
				//home.jsp가 로그인할 수 있는 페이지가 되면됨
				return "redirect:/";
			} else {
				//실패하면 에러페이지로 이동
				model.addAttribute("msg", "회원가입이 완료되지 않았습니다.");
				model.addAttribute("error", "회원가입 실패");
				model.addAttribute("url", "/member/register.kh");
				return "home";
			}
		

	}
	
}
