package com.bringbring.user.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.github.scribejava.core.model.OAuth2AccessToken;

public interface SocialLoginService {

	/**
	 * 카카오 토큰 가져오는 service
	 * @param code
	 * @return String
	 * @throws Exception
	 */
	String getKakaoToken(String code) throws Exception;

	/**
	 * 카카오 회원정보 가져오는 service
	 * @param access_token
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	Map<String, Object> getUserInfo(String access_token) throws Exception;

	/**
	 * 카카오 로그아웃 service
	 * @param attribute
	 * @throws Exception 
	 */
	void kakaoLogout(String kakaoAccessToken) throws Exception;

	/**
	 * 네이버 로그인 Url 가져오는 service
	 * @param code
	 * @return String
	 */
	String getAuthorizational(HttpSession session);

	/**
	 * 네이버 토근 가져오는 service
	 * @param session 
	 * @param code
	 * @param state 
	 * @return OAuth2AccessToken
	 * @throws Exception 
	 */
	OAuth2AccessToken getNaverToken(HttpSession session, String code, String state) throws Exception;

	/**
	 * 네이버 사용자 프로필 API 호출 service
	 * @param oauthToken
	 * @return String
	 * @throws Exception 
	 */
	String getUserProfile(OAuth2AccessToken accessToken) throws Exception;

	/**
	 * 네이버로그인 social_user_tbl 추가 service
	 * @param userInfo
	 * @return int
	 */
	int insertNaver(Map<String, Object> userInfo);

}
