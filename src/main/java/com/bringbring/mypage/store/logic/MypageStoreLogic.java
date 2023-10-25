package com.bringbring.mypage.store.logic;

import java.util.List;

import com.bringbring.chatting.domain.ChatData;
import com.bringbring.common.PageInfo;
import com.bringbring.divide.domain.DivideData;
import com.bringbring.divide.domain.HeartData;
import org.apache.ibatis.session.RowBounds;
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

    @Override
    public int getHeartListCountByNo(int userNo) { return sqlSession.selectOne("DivideMapper.getHeartListCountByNo", userNo); }

	@Override
	public List<HeartData> selectHeartList(PageInfo pInfo, int userNo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList("DivideMapper.selectHeartList", userNo, rowBounds);
	}

	@Override
	public int getDivideListCountByNo(int userNo) { return sqlSession.selectOne("DivideMapper.getDivideListCountByNo", userNo); }

	@Override
	public List<DivideData> selectMypageDivideList(PageInfo pInfo, int userNo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList("DivideMapper.selectMypageDivideList", userNo, rowBounds);
	}

    @Override
    public int getChatDataListCountByNo(int userNo) {
        return sqlSession.selectOne("DivideMapper.getChatDataListCountByNo", userNo);
    }

	@Override
	public List<ChatData> selectMypageChatList(PageInfo pInfo, int userNo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList("DivideMapper.selectMypageChatList", userNo, rowBounds);
	}

    @Override
    public int updateDivideYn(int divNo) { return sqlSession.update("DivideMapper.updateDivideYn", divNo); }
}
