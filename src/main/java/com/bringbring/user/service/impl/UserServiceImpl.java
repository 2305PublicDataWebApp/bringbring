package com.bringbring.user.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bringbring.user.domain.User;
import com.bringbring.user.service.UserService;
import com.bringbring.user.store.UserStore;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class UserServiceImpl implements UserService {
	
	private final UserStore userStore;

	@Override
	public int selectCheckLogin(User user) {
		return userStore.selectCheckLogin(user);
	}
	
	@Override
	public int selectListCount() { return userStore.selectListCount(); }

	@Override
	public List<User> selectUserList(PageInfo pInfo) { return userStore.selectUserList(pInfo);}
	
}
