package com.bringbring.reservation.store.logic;

import com.bringbring.common.PageInfo;
import com.bringbring.image.domain.Image;
import com.bringbring.reservation.domain.*;
import com.bringbring.reservation.store.ReservationStore;
import com.bringbring.user.domain.User;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
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
    public List<ReservationComplete> selectReservationCompleteInfo(String payId) {
        return sqlSession.selectList("ReservationMapper.selectReservationCompleteInfo", payId);

    }

    @Override
    public Image selectImageNo(String imageRename) {
        return sqlSession.selectOne("ReservationMapper.selectImageNo", imageRename);
    }

    @Override
    public Reservation selectReservationNo(int userNo) {
        return sqlSession.selectOne("ReservationMapper.selectReservationNo");
    }

    @Override
    public ReservationDetail selectReservationDetailNo(int rvNo) {
        return sqlSession.selectOne("ReservationMapper.selectReservationDetailNo", rvNo);
    }

    @Override
    public List<WasteData> selectpayCompleteWasteDate(String payId) {
        return sqlSession.selectList("ReservationMapper.selectpayCompleteWasteDate", payId);
    }

    @Override
    public User selectUserNo(String userId) {
        return sqlSession.selectOne("ReservationMapper.selectUserNo", userId);
    }

    @Override
    public int selectReservationListCount(int userNo) {
        return sqlSession.selectOne("ReservationMapper.selectReservationListCount", userNo);
    }

    @Override
    public List<ReservationComplete> selectMyReservationList(PageInfo pageInfo, int userNo) {
        int limit = pageInfo.getRecordCountPerPage();
        int offset = (pageInfo.getCurrentPage() - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);
        return sqlSession.selectList("ReservationMapper.selectMyReservationList", userNo, rowBounds);
    }

    @Override
    public List<WasteData> selectAllWasteList() {

        return sqlSession.selectList("ReservationMapper.selectAllWasteList");
    }

    @Override
    public Pay selectPayInfoByPayId(String payId) {
        return sqlSession.selectOne("ReservationMapper.selectPayInfoByPayId", payId);
    }

    @Override
    public Reservation selectReservationNoByRvNo(int rvNo) {
        return sqlSession.selectOne("ReservationMapper.selectReservationNoByRvNo", rvNo);
    }

    @Override
    public int updateReservationIsCancel(int rvNo) {
        return sqlSession.update("ReservationMapper.updateReservationIsCancel", rvNo);
    }

    @Override
    public int updatePayIsCancel(int rvDetailNo) {
        return sqlSession.update("ReservationMapper.updatePayIsCancel", rvDetailNo);
    }

    @Override
    public int insertPayCancel(PayCancel payCancel) {
        return sqlSession.insert("ReservationMapper.insertPayCancel", payCancel);
    }

    @Override
    public ReservationDetail selectReservationDetailByDetailNo(int rvDetailNo) {
        return sqlSession.selectOne("ReservationMapper.selectReservationDetailByDetailNo", rvDetailNo);
    }

    @Override
    public CancelRequest selectPayIdByDischargeNo(String dischargeNo) {
        return sqlSession.selectOne("ReservationMapper.selectPayIdByDischargeNo", dischargeNo);
    }

    @Override
    public List<ReservationComplete> selectMyReservationDetailImage(Connection connection) {
        return sqlSession.selectList("ReservationMapper.selectMyReservationDetailImage", connection);
    }

    @Override
    public List<ReservationComplete> selectMyReservationDetailList(int rvNo) {
        return sqlSession.selectList("ReservationMapper.selectMyReservationDetailList", rvNo);

    }


}
