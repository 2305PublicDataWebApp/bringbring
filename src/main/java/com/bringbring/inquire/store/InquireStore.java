package com.bringbring.inquire.store;

import java.util.List;

import com.bringbring.inquire.domain.Inquire;

public interface InquireStore {

	/**
	 * 회원별 문의내역 리스트 store
	 * @param userNo
	 * @return Inquire
	 */
	List<Inquire> selectInquireListByUserNo(int userNo);

}
