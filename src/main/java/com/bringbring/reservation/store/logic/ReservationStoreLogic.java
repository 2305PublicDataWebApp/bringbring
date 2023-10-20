package com.bringbring.reservation.store.logic;

import com.bringbring.image.domain.Image;
import com.bringbring.reservation.domain.*;
import com.bringbring.reservation.store.ReservationStore;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class ReservationStoreLogic implements ReservationStore {

    private final SqlSession sqlSession;

    @Override
    public List<WasteData> selectWasteList(String selectItem) {
        return this.sqlSession.selectList("ReservationMapper.selectWasteList", selectItem);
    }

    @Override
    public List<WasteCategory> selectWasteCategoryList() {
        return sqlSession.selectList("ReservationMapper.selectWasteCategoryList");
    }

    @Override
    public WasteData selectInfoNoData(Integer wasteInfoNo) {
        return sqlSession.selectOne("ReservationMapper.slectInfoNoData", wasteInfoNo);
    }

    @Override
    public int insertResertvation(Reservation reservationUserInfo) {
        return sqlSession.insert("ReservationMapper.insertResertvation", reservationUserInfo);
    }

    @Override
    public int insertReservationDetail(ReservationDetail reservationDetail) {
        return sqlSession.insert("ReservationMapper.insertReservationDetail", reservationDetail);
    }

    @Override
    public int selectRvDetailMaxNo() {
        return sqlSession.selectOne("ReservationMapper.selectRvDetailMaxNo");
    }

    @Override
    public int insertReservationImage(Image image) {
        return sqlSession.insert("ReservationMapper.insertReservationImage", image);
    }

    @Override
    public int selectReservationImage(String imageRename) {
        return sqlSession.selectOne("ReservationMapper.selectReservationImage", imageRename);
    }

    @Override
    public int insertConnection(Connection connection) {
        return sqlSession.insert("ReservationMapper.insertConnection", connection);
    }

    @Override
    public int insertPay(Pay pay) {
        return sqlSession.insert("ReservationMapper.insertPay", pay);
    }

    @Override
    public ReservationComplete selectReservationCompleteInfo(String payId) {
        return sqlSession.selectOne("ReservationMapper.selectReservationCompleteInfo", payId);
    }
}
