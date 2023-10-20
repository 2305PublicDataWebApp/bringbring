package com.bringbring.user.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bringbring.user.domain.User;
import com.bringbring.user.service.SocialLoginService;
import com.bringbring.user.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SocialLoginController {
	
	private final SocialLoginService socialLoginService;
	private final UserService userService;
	
	@RequestMapping("/social/kakaoLogin.do")
	public String kakaoLogin(HttpServletRequest request
			, String code
			, Model model
			, HttpSession session) throws Exception {
		
		// code로 토큰받고 저장
		String access_token = socialLoginService.getToken(code);
		
		Map<String, Object> userInfo = socialLoginService.getUserInfo(access_token);
		String userId = (String)userInfo.get("userId");
		User kakaoUser = userService.selectOneById(userId);
		
		if(kakaoUser != null) {
			session.setAttribute("access_token", access_token);
			session.setAttribute("sessionId", kakaoUser.getUserId());
			session.setAttribute("sessionName", kakaoUser.getUserName());
			return "redirect:/";
		}else {
			model.addAttribute("msg", "카카오 로그인이 완료되지 않았습니다.");
			model.addAttribute("error", "카카오 로그인 실패");
			model.addAttribute("url", "/user/login.do");
			return "common/error";
		}
		
	}

}
