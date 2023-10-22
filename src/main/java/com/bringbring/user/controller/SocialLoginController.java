package com.bringbring.user.controller;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bringbring.user.domain.User;
import com.bringbring.user.service.SocialLoginService;
import com.bringbring.user.service.UserService;
import com.github.scribejava.core.model.OAuth2AccessToken;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SocialLoginController {
	
	private final SocialLoginService socialLoginService;
	private final UserService userService;
	
	// 카카오 로그인
	@RequestMapping("/social/kakaoLogin.do")
	public String kakaoLogin(HttpServletRequest request
			, HttpServletResponse response
			, String code
			, Model model
			, HttpSession session) throws Exception {
		// code로 토큰받고 저장
		String access_token = socialLoginService.getKakaoToken(code);
		
		Map<String, Object> userInfo = socialLoginService.getUserInfo(access_token);
		String userId = (String)userInfo.get("userId");
		User kakaoUser = userService.selectOneById(userId);
		
		if(kakaoUser != null) {
			session.setAttribute("kakaoAccessToken", access_token);
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

	// 네이버 로그인 Url
	@RequestMapping("/social/naverLoginUrl.do")
	public String naverLoginUrl (HttpSession session){
		
		String naverAuthUrl = socialLoginService.getAuthorizational(session);
		
		System.out.println("네이버 로그인 url : " + naverAuthUrl);
		
		return "redirect:" + naverAuthUrl;
	}
	
	// 네이버 로그인
	@RequestMapping("/social/naverLogin.do")
	public String naverLogin(@RequestParam String state
			, @RequestParam String code
			, Model model
			, HttpSession session) throws Exception {
		Map<String, Object> userInfo = new HashMap<>();
		
		// accessToken 가져오기
		OAuth2AccessToken accessToken = socialLoginService.getNaverToken(session, code, state);

		// 액세스 토큰에서 access_token 값을 가져와서 세션에 저장
		String naverAccessToken = accessToken.getAccessToken();
		session.setAttribute("naverAccessToken", naverAccessToken);
		
		// accessToken으로 정보 불러오기
		String apiResult = socialLoginService.getUserProfile(accessToken); // String 형식의 json데이터
		System.out.println("apiResult : " + apiResult.toString());
		
		// String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		
		// Object 타입으로 업캐스팅을 한 다음, 다시 JSONObject 타입으로 다운캐스팅
		Object resultObj = parser.parse(apiResult);
		JSONObject jsonResultObj = (JSONObject) resultObj;
		
		// 데이터 파싱
		JSONObject responseObj = (JSONObject)jsonResultObj.get("response");
		String userName = (String)responseObj.get("name");
		String userId = (String)responseObj.get("email");
		// 전화번호는 '-' 빼기
		String mobile = (String)responseObj.get("mobile");
		String userPhone = mobile.replace("-","");
		
		userInfo.put("userName", userName);
        userInfo.put("userId", userId);
        userInfo.put("access_token", naverAccessToken);
        userInfo.put("userPhone", userPhone);
        userInfo.put("userProfileName","default_image.png");
        userInfo.put("userProfileRename","default_image.png");
        userInfo.put("userProfilePath","../resources/assets/img/mypage/default_image.png");
        userInfo.put("userProfileLength",0L);
        
        System.out.println("userInfo: " + userInfo);
        User naverUser = userService.selectOneById(userId);
        
        if(naverUser == null) {
        	SecureRandom random = new SecureRandom();
        	String userPwd = new BigInteger(40, random).toString(32);
        	userInfo.put("userPwd", userPwd);
        	int insertResult = socialLoginService.insertNaver(userInfo);
        	if(insertResult > 0) {
        		System.out.println("네이버 회원가입 성공");
        	}
        }
        if(naverUser != null) {
			session.setAttribute("sessionId", naverUser.getUserId());
			session.setAttribute("sessionName", naverUser.getUserName());
			return "redirect:/";
		}else {
			model.addAttribute("msg", "네이버 로그인이 완료되지 않았습니다.");
			model.addAttribute("error", "네이버 로그인 실패");
			model.addAttribute("url", "/user/login.do");
			return "common/error";
		}
	}

}
