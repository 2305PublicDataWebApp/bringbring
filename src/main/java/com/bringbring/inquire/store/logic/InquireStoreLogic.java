package com.bringbring.inquire.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bringbring.inquire.domain.Inquire;
import com.bringbring.inquire.store.InquireStore;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class InquireStoreLogic implements InquireStore{

	private final SqlSession sqlSession;
	
	@Override
	public List<Inquire> selectInquireListByUserNo(int userNo) {
		return sqlSession.selectList("inquireMapper.selectInquireListByUserNo",userNo);
	}
	
}
