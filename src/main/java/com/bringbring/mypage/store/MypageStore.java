package com.bringbring.mypage.store;

import java.util.List;

import com.bringbring.reservation.domain.ReservationComplete;

public interface MypageStore {

	/**
	 * 회원별 신청 내역 store
	 * @param userNo
	 * @return List<ReservationComplete>
	 */
	List<ReservationComplete> selectReservationByuserNo(int userNo);

}
