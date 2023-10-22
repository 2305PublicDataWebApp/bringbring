package com.bringbring.reservation.store;

import com.bringbring.image.domain.Image;
import com.bringbring.reservation.domain.*;

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

}
