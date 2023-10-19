package com.bringbring.user.service;

import java.util.Map;

import com.bringbring.user.domain.User;

public interface SocialLoginService {

	/**
	 * 카카오 토큰 가져오는 service
	 * @param code
	 * @return
	 * @throws Exception
	 */
	String getToken(String code) throws Exception;

	/**
	 * 카카오 회원정보 가져오는 service
	 * @param access_token
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> getUserInfo(String access_token) throws Exception;

	/**
	 * 카카오 로그아웃 service
	 * @param attribute
	 * @throws Exception 
	 */
	void kakaoLogout(String access_Token) throws Exception;

}
