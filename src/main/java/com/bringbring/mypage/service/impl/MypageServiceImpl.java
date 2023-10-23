package com.bringbring.mypage.service.impl;

import java.util.List;

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
}
