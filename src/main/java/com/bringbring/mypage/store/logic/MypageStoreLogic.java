package com.bringbring.mypage.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bringbring.mypage.store.MypageStore;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MypageStoreLogic implements MypageStore{
	
	private final SqlSession sqlSession;
}
