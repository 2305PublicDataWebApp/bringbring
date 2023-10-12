package com.bringbring.user.service;

import java.util.List;

import com.bringbring.user.domain.User;

public interface UserService {

	/**
	 * 로그인 service
	 * @param user
	 * @return int
	 */
	public int selectCheckLogin(User user);
	
	/**
	 * 회원 수 조회 service
	 * @return int
	 */
	   int selectListCount();

	/**
	 * 회원 리스트 조회 service
	 * @param pInfo
	 * @return List<User></User>
	 */
	List<User> selectUserList(PageInfo pInfo);

}
