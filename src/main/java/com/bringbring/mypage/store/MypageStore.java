package com.bringbring.mypage.store;

import java.util.List;

import com.bringbring.common.PageInfo;
import com.bringbring.divide.domain.DivideData;
import com.bringbring.divide.domain.HeartData;
import com.bringbring.reservation.domain.ReservationComplete;

public interface MypageStore {

	/**
	 * 회원별 신청 내역 store
	 * @param userNo
	 * @return List<ReservationComplete>
	 */
	List<ReservationComplete> selectReservationByuserNo(int userNo);

	/**
	 * 총 찜한 게시물 개수 store
	 * @param userNo
	 * @return
	 */
    int getHeartListCountByNo(int userNo);

	/**
	 * 찜 내역 store
	 * @param pInfo
	 * @param userNo
	 * @return
	 */
	List<HeartData> selectHeartList(PageInfo pInfo, int userNo);

	int getDivideListCountByNo(int userNo);

	List<DivideData> selectMypageDivideList(PageInfo pInfo, int userNo);
}
