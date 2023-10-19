package com.bringbring.user.service;

import java.util.Map;

import com.bringbring.user.domain.User;

public interface SocialLoginService {

//	String getNaverAuthorizeUrl(String type);

	String getToken(String code) throws Exception;

	Map<String, Object> getUserInfo(String access_token) throws Exception;

}
