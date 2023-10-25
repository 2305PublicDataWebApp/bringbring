package com.bringbring.mypage.service.impl;

import java.util.List;

import com.bringbring.chatting.domain.ChatData;
import com.bringbring.common.PageInfo;
import com.bringbring.divide.domain.DivideData;
import com.bringbring.divide.domain.HeartData;
import org.springframework.stereotype.Service;

import com.bringbring.mypage.service.MypageService;
import com.bringbring.mypage.store.MypageStore;
import com.bringbring.reservation.domain.ReservationComplete;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MypageServiceImpl implements MypageService{

	private final MypageStore mypageStore;

	@Override
	public List<ReservationComplete> selectReservationByuserNo(int userNo) {
		return mypageStore.selectReservationByuserNo(userNo);
	}

	@Override
	public int getHeartListCountByNo(int userNo) { return mypageStore.getHeartListCountByNo(userNo); }

	@Override
	public PageInfo getPageInfo(Integer currentPage, int totalCount) {
		PageInfo pi = null;
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		int naviTotalCount;
		int startNavi;
		int endNavi;

		naviTotalCount = (int)((double) totalCount / recordCountPerPage + 0.9);

		startNavi = (((int) ((double) currentPage / naviCountPerPage + 0.9)) - 1) * naviCountPerPage + 1;

		endNavi = startNavi + naviCountPerPage - 1;
		if (endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}

		pi = new PageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage,
				startNavi, endNavi);
		return pi;
	}

	@Override
	public List<HeartData> selectHeartList(PageInfo pInfo, int userNo) { return mypageStore.selectHeartList(pInfo, userNo); }

	@Override
	public int getDivideListCountByNo(int userNo) { return mypageStore.getDivideListCountByNo(userNo); }

	@Override
	public List<DivideData> selectMypageDivideList(PageInfo pInfo, int userNo) { return mypageStore.selectMypageDivideList(pInfo, userNo); }

    @Override
    public int getChatDataListCountByNo(int userNo) {
        return mypageStore.getChatDataListCountByNo(userNo);
    }

	@Override
	public List<ChatData> selectMypageChatList(PageInfo pInfo, int userNo) { return mypageStore.selectMypageChatList(pInfo, userNo); }

    @Override
    public int updateDivideYn(int divNo) { return mypageStore.updateDivideYn(divNo); }
}
