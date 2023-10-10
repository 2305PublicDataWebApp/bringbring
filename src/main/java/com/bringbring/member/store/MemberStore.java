package com.bringbring.member.store;

import org.apache.ibatis.session.SqlSession;

import com.bringbring.member.domain.Member;

public interface MemberStore {
	
	public int insertMember(Member member);
}
