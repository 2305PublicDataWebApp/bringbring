package com.bringbring.user.store;

import com.bringbring.user.domain.User;

public interface UserStore {

	/**
	 * 로그인 store
	 * @param user
	 * @return int
	 */
	public int selectCheckLogin(User user);

}
