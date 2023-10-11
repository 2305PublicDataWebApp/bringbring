package com.bringbring.user.service;

import com.bringbring.user.domain.User;

public interface UserService {

	/**
	 * 로그인 service
	 * @param user
	 * @return int
	 */
	public int selectCheckLogin(User user);

}
