package com.bringbring.user.store;

import java.util.List;
import java.util.Map;

import com.bringbring.common.PageInfo;
import com.bringbring.user.domain.User;

public interface UserStore {

	/**
	 * 로그인 store
	 * @param user
	 * @return int
	 */
	User selectCheckLogin(User user);

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
	int insertUser(User user);

	/**
	 * 이름,전화번호로 회원정보 가져오기 store
	 * @param user
	 * @return User
	 */
	User selectOneFindEmail(User user);

  /**
	 * 아이디로 회원정보 불러오기 store
	 * @param userId
	 * @return User
	 */
	User selectOneById(String userId);

	/**
	 * 맥스 시퀀스 조회 store
	 * @param user
	 * @return
	 */
	int selectOneByNo(User user);

  /**
	 * 회원정보 수정 store
	 * @param user 
	 * @return int
	 */
	int updateUser(User user);

	/**
	 * 이름,전화번호, 아이디로 회원정보 가져오기 store
	 * @param user
	 * @return User
	 */
	User selectOneFindPwd(User user);

	/**
	 * 회원 탈퇴 store
	 * @param userId
	 * @return int
	 */
	int deleteUser(String userId);

}
