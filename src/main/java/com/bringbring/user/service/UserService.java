package com.bringbring.user.service;

import java.util.List;

import com.bringbring.common.PageInfo;
import com.bringbring.user.domain.User;

public interface UserService {

	/**
	 * 로그인 service
	 * @param user
	 * @return User
	 */
	User selectCheckLogin(User user);
	
	/**
	 * 회원 수 조회 service
	 * @return int
	 */
	   int selectListCount();

	/**
	 * 회원 리스트 조회 service
	 * @param pInfo
	 * @return List<User>
	 */
	List<User> selectUserList(PageInfo pInfo);

	/**
	 * 회원가입 service
	 * @param user
	 * @return int
	 */
	int insertUser(User user);

	/**
	 * 이름,전화번호로 회원정보 가져오기 service
	 * @param user
	 * @return User
	 */
	User selectOneFindEmail(User user);

	/**
	 * 아이디로 회원정보 가져오기 service
	 * @param userId
	 * @return User
	 */
    User selectOneById(String userId);

    /**
     * 회원정보 수정 service
     * @param user
     * @return int
     */
    int updateUser(User user);

    /**
     * 이름, 전화번호, 아이디로 회원정보 가져오기 service
     * @param user
     * @return User
     */
	User selectOneFindPwd(User user);

}
