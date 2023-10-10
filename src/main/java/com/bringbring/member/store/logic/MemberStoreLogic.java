package com.bringbring.member.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bringbring.member.domain.Member;
import com.bringbring.member.store.MemberStore;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MemberStoreLogic implements MemberStore{

	private final SqlSession session;
	
	@Override
	public int insertMember(Member member) {
		return session.insert("MemberMapper.insertMember", member);
	}
}
