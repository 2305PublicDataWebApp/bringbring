package com.bringbring.user.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bringbring.user.domain.User;
import com.bringbring.user.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {
	
	
	private final UserService userService;
	
	// 로그인 
	@GetMapping("/login.do")
	public String showLoginform() {
		return "user/login";
	}
	
	// 로그인 기능
	@PostMapping("/login.do")
	public String userLogin(
			@Valid @ModelAttribute User user
			, Model model
			, HttpSession session) {
		
		int result = userService.selectCheckLogin(user);
		if(result>0) {
			session.setAttribute("sessionId", user.getUserId());
			session.setAttribute("sessionPwd", user.getUserPwd());
			//성공하면 로그인페이지
			return "redirect:/";
		} else {
			//실패하면 에러페이지로 이동
			model.addAttribute("msg", "로그인이 완료되지 않았습니다.");
			model.addAttribute("error", "로그인 실패");
			model.addAttribute("url", "/user/insert.do");
			return "common/error";
		}
	}
	
	// 회원가입
	@GetMapping("/insert.do")
	public String showInsertUserForm() {
		return "user/insert";
	}
	
	// 회원가입 기능
	@PostMapping("/insert.do")
	public String insertUser() {
		return"";
	}

}
