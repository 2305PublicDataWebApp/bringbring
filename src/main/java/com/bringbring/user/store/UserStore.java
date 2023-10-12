package com.bringbring.user.store;

import java.util.List;

import com.bringbring.common.PageInfo;
import com.bringbring.user.domain.User;

public interface UserStore {

	/**
	 * 로그인 store
	 * @param user
	 * @return int
	 */
	public int selectCheckLogin(User user);

	/**
	 * 회원 수 조회 store
	 *
	 */
	int selectListCount();

	/**
	 * 회원 리스트 조회 store
	 * @param pInfo
	 * @return List<User>
	 */
	List<User> selectUserList(PageInfo pInfo);
}
