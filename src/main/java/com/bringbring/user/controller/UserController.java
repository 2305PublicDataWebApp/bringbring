package com.bringbring.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bringbring.member.domain.Member;
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
			@ModelAttribute User user
			, Model model
			, HttpSession session) {
		User userOne = userService.selectCheckLogin(user);
		if(userOne != null) {
			session.setAttribute("sessionId", userOne.getUserId());
			session.setAttribute("sessionName", userOne.getUserName());
			//성공하면 메인화면
			return "redirect:/";
		} else {
			//실패하면 에러페이지로 이동
			model.addAttribute("msg", "로그인이 완료되지 않았습니다.");
			model.addAttribute("error", "로그인 실패");
			model.addAttribute("url", "/user/login.do");
			return "common/error";
		}
	}
	
	// 로그아웃 기능
	@GetMapping("/logout.do")
	public String userLogout(
			HttpSession session) {
		if(session != null) {
			session.invalidate();
		}
		return "redirect:/";
	}
	
	// 회원가입
	@GetMapping("/insert.do")
	public String showInsertUserForm() {
		return "user/insert";
	}
	
	// 회원가입 기능
	@PostMapping("/insert.do")
	public String insertUser(
			@ModelAttribute User user
			, Model model) {
		
		int result = userService.insertUser(user);
		if(result>0) {
			return "user/login";
		}else {
			//실패하면 에러페이지로 이동
			model.addAttribute("msg", "회원가입이 완료되지 않았습니다.");
			model.addAttribute("error", "회원가입 실패");
			model.addAttribute("url", "/user/insert.do");
			return "common/error";
		}
	}
	
	// 아이디(이메일) 중복 확인
	@ResponseBody
	@PostMapping("/Email_check.do")
	public Map<String, String>  selectOneByuserId(
			@RequestParam("userId") String userId) {
		Map<String, String> response = new HashMap<>();
		
		User userOne = userService.selectOneByuserId(userId);
		if(userOne != null) {
			if(userId.equals(userOne.getUserId())) {
				response.put("unavailable", "이미 사용중인 이메일입니다.");
			}else {				
				response.put("available", "사용가능한 이메일입니다.");
			}
		}else {
			response.put("available", "사용가능한 이메일입니다.");
		}
		return response;
	}
	
	// 아이디(이메일) 찾기
	@GetMapping("/findEmail.do")
	public String showFindEmailForm() {
		return "user/findEmail";
	}
	
	// 아이디(이메일) 찾기 기능
	@ResponseBody
	@PostMapping("/findEmail.do")
	public Map<String, String> selectOneByName(
			@ModelAttribute User user
			, Model model) {
		Map<String, String> response = new HashMap<>();
		
		User userOne = userService.selectOneByName(user);
		if(userOne != null) {
			String result = userOne.getUserId();
			response.put("userId", result);
		}else {
			response.put("error","정보를 찾을 수 없습니다.");
		}
		return response;
	}
	
	// 비밀번호 찾기 
	@GetMapping("/findPwd.do")
	public String showFindPwdForm() {
		return "user/findPwd";
	}
	
	@PostMapping("/findPWd.do")
	public String selectOneByuserId() {
		
		return "";
	}

}
