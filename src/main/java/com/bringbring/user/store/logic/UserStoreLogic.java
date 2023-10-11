package com.bringbring.user.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bringbring.user.domain.User;
import com.bringbring.user.store.UserStore;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class UserStoreLogic implements UserStore{
	
	private final SqlSession sqlSession;

	@Override
	public int selectCheckLogin(User user) {
		return sqlSession.selectOne("UserMapper.selectCheckLogin");
	}

}
