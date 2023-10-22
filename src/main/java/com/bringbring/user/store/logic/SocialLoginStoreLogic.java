package com.bringbring.user.store.logic;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bringbring.user.store.SocialLoginStore;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class SocialLoginStoreLogic implements SocialLoginStore {

	private final SqlSession sqlSession;
	
	@Override
	public int insertKakao(Map<String, Object> userInfo) {
		return sqlSession.insert("UserMapper.insertKakao", userInfo);
	}
	
	@Override
	public int insertNaver(Map<String, Object> userInfo) {
		return sqlSession.insert("UserMapper.insertNaver", userInfo);
	}

}
