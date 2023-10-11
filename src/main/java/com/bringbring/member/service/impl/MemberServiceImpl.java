package com.bringbring.member.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bringbring.member.domain.Member;
import com.bringbring.member.service.MemberService;
import com.bringbring.member.store.MemberStore;

import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class MemberServiceImpl implements MemberService{

	private final MemberStore mStore;
	
	@Override
	public int insertMember(Member member) {
		int result = mStore.insertMember(member);
		return result;
	}

}
