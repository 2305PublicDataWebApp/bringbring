package com.bringbring.mypage.service;

import java.util.List;

import com.bringbring.chatting.domain.ChatData;
import com.bringbring.common.PageInfo;
import com.bringbring.divide.domain.DivideData;
import com.bringbring.divide.domain.HeartData;
import com.bringbring.reservation.domain.ReservationComplete;

public interface MypageService {

	/**
	 * 회원별 신청 내역 service
	 * @param userNo
	 * @return List<ReservationComplete>
	 */
	List<ReservationComplete> selectReservationByuserNo(int userNo);

	/**
	 * 총 찜한 게시물 개수 service
	 * @param userNo
	 * @return
	 */
    int getHeartListCountByNo(int userNo);

	/**
	 * 페이징 처리 service
	 * @param currentPage
	 * @param totalCount
	 * @return
	 */
	PageInfo getPageInfo(Integer currentPage, int totalCount);

	/**
	 * 찜 내역 service
	 * @param pInfo
	 * @param userNo
	 * @return
	 */
	List<HeartData> selectHeartList(PageInfo pInfo, int userNo);

	int getDivideListCountByNo(int userNo);

	List<DivideData> selectMypageDivideList(PageInfo pInfo, int userNo);

    int getChatDataListCountByNo(int userNo);

	List<ChatData> selectMypageChatList(PageInfo pInfo, int userNo);

    int updateDivideYn(int divNo);
}
