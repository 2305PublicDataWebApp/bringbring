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
	public User selectCheckLogin(User user);

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

	/**
	 * 회원가입 store
	 * @param user
	 * @return int
	 */
	public int insertUser(User user);

	/**
	 * 아이디(이메일) 찾기 store
	 * @param user
	 * @return
	 */
	public User selectOneByName(User user);

	/**
	 * 아이디로 회원정보 불러오기 store
	 * @param userId
	 * @return
	 */
	public User selectOneById(String userId);
}
