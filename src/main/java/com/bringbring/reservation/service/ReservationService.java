package com.bringbring.reservation.service;

import com.bringbring.common.PageInfo;
import com.bringbring.reservation.domain.*;
import com.bringbring.user.domain.User;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public interface ReservationService {
    List<WasteData> selectWasteList(String selectItem);

    List<WasteCategory> selectWasteCategoryList();

    WasteData selectInfoNoData(Integer wasteInfoNo);

    Map<String, Object> addImages(String[] wasteInfo, String[] imageIndexNo, MultipartFile[] uploadFiles, HttpServletRequest request);

    Integer insertReservation(List<Integer> selectedItems, Map<String, Object> imageAdd, Reservation reservationUserInfo, ReservationDetail reservationDetail, Pay pay);

    List<ReservationComplete> selectReservationCompleteInfo(String payId);

    List<WasteData> selectpayCompleteWasteDate(String payId);

    User selectUserNo(String userId);

    int selectReservationListCount(int userNo);

    PageInfo getPageInfo(Integer currentPage, int userNo, int totalCount);

//    List<ReservationComplete> selectReservationList(PageInfo pageInfo, int userNo);

    List<WasteData> AllWasteList();

    Pay selectPayInfoByPayId(String payId);

    CancelRequest selectPayIdByDischargeNo(String dischargeNo);

    List<ReservationComplete> selectMyReservationList(PageInfo pageInfo, int userNo);

    List<ReservationComplete> selectMyReservationDetailImage(Connection connection);

    List<ReservationComplete> selectMyReservationDetailList(int rvNo);
}
