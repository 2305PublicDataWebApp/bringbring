package com.bringbring.user.store;

import java.util.Map;

public interface SocialLoginStore {
	
	/**
	 * 카카오로그인 user_tbl 추가 store
	 * @param userInfo
	 */
	int insertKakao(Map<String, Object> userInfo);

	/**
	 * 네이버로그인 social_user_tbl 추가 store
	 * @param userInfo
	 * @return
	 */
	int insertNaver(Map<String, Object> userInfo);

}
