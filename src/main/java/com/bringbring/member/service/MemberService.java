package com.bringbring.member.service;

import org.springframework.transaction.annotation.Transactional;

import com.bringbring.member.domain.Member;

public interface MemberService {
	/**
	 * 회원가입 service
	 * @param member
	 * @return int
	 */
	public int insertMember(Member member);
}
