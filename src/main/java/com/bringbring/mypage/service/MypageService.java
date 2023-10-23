package com.bringbring.mypage.service;

import java.util.List;

import com.bringbring.reservation.domain.ReservationComplete;

public interface MypageService {

	/**
	 * 회원별 신청 내역 service
	 * @param userNo
	 * @return List<ReservationComplete>
	 */
	List<ReservationComplete> selectReservationByuserNo(int userNo);

}
