package com.bringbring.reservation.store;

import com.bringbring.common.PageInfo;
import com.bringbring.image.domain.Image;
import com.bringbring.region.domain.Region;
import com.bringbring.reservation.domain.*;
import com.bringbring.user.domain.User;

import java.util.List;

public interface ReservationStore {
    List<WasteData> selectWasteList(String selectItem);

    List<WasteCategory> selectWasteCategoryList();

    WasteData selectInfoNoData(Integer wasteInfoNo);

    int insertResertvation(Reservation reservationUserInfo);

    int insertReservationDetail(ReservationDetail reservationDetail);

    int selectRvDetailMaxNo();

    int insertReservationImage(Image image);

    int selectReservationImage(String imageRename);

    int insertConnection(Connection connection);

    int insertPay(Pay pay);

    List<ReservationComplete> selectReservationCompleteInfo(String payId);

    Image selectImageNo(String imageRename);

    Reservation selectReservationNo(int userNo);

    ReservationDetail selectReservationDetailNo(int rvNo);

    List<WasteData> selectpayCompleteWasteDate(String payId);

    User selectUserNo(String userId);

    int selectReservationListCount(int userNo);

    List<ReservationComplete> selectMyReservationList(PageInfo pageInfo, int userNo);

    List<WasteData> selectAllWasteList();

    Pay selectPayInfoByPayId(String payId);

    Reservation selectReservationNoByRvNo(int rvNo);

    int updateReservationIsCancel(int rvNo);

    int updatePayIsCancel(int rvDetailNo);

    int insertPayCancel(PayCancel payCancel);

    ReservationDetail selectReservationDetailByDetailNo(int rvDetailNo);

    CancelRequest selectPayIdByDischargeNo(String dischargeNo);

    List<ReservationComplete> selectMyReservationDetailImage(Connection connection);

    List<ReservationComplete> selectMyReservationDetailList(int rvNo);

    List<ReservationComplete> selectInfoByDischargeNo(Reservation reservation);

    List<Region> selectCityList(int selectItem);
}
