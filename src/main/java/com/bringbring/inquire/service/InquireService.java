package com.bringbring.inquire.service;

import java.util.List;

import com.bringbring.inquire.domain.Inquire;

public interface InquireService {

	/**
	 * 회원별 문의내역 리스트 service
	 * @param userNo
	 * @return Inquire
	 */
	List<Inquire> selectInquireListByUserNo(int userNo);

}
