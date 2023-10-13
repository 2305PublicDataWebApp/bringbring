package com.bringbring.user.service.impl;

import java.util.List;

import com.bringbring.admin.service.AdminService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bringbring.common.PageInfo;
import com.bringbring.user.domain.User;
import com.bringbring.user.service.UserService;
import com.bringbring.user.store.UserStore;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class UserServiceImpl implements UserService {
	
	private final UserStore userStore;
	private final AdminService adminService;
	@Override
	@Transactional(readOnly = true)
	public User selectCheckLogin(User user) {
		return userStore.selectCheckLogin(user);
	}
	
	@Override
	public int selectListCount() { return userStore.selectListCount(); }

	@Override
	public List<User> selectUserList(PageInfo pInfo) { return userStore.selectUserList(pInfo);}

	@Override
	public int insertUser(User user) {
		// 회원 정보 삽입
		int result = userStore.insertUser(user);
		if (result > 0) {
			// 회원 정보가 성공적으로 삽입되었으면 롤 정보 삽입
			int roleResult = adminService.insertRole();
			if (roleResult > 0) {
				// 롤 정보도 성공적으로 삽입되었으면 성공 반환
				return result;
			} else {
				// 롤 정보 삽입 실패 시 롤백을 위해 RuntimeException 던지기
				throw new RuntimeException("롤 정보 삽입에 실패하였습니다.");
			}
		} else {
			// 회원 정보 삽입 실패 시 롤백을 위해 RuntimeException 던지기
			throw new RuntimeException("회원 정보 삽입에 실패하였습니다.");
		}
	}

	@Override
	@Transactional(readOnly = true)
	public User selectOneByName(User user) {
		return userStore.selectOneByName(user);
	}

	@Override
	@Transactional(readOnly = true)
	public User selectOneByuserId(String userId) {
		return userStore.selectOneByuserId(userId);
	}
	@Override
	public User selectOneById(String userId) { return userStore.selectOneById(userId); }

}
