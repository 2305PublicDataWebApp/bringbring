package com.bringbring.mypage.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bringbring.mypage.store.MypageStore;
import com.bringbring.reservation.domain.ReservationComplete;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class MypageStoreLogic implements MypageStore{
	
	private final SqlSession sqlSession;

	@Override
	public List<ReservationComplete> selectReservationByuserNo(int userNo) {
		return sqlSession.selectList("ReservationMapper.selectReservationByuserNo", userNo);
	}
}
