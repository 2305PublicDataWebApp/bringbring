package com.bringbring.reservation.service;

import com.bringbring.reservation.domain.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public interface ReservationService {
    List<WasteData> selectWasteList(String selectItem);

    List<WasteCategory> selectWasteCategoryList();

    WasteData selectInfoNoData(Integer wasteInfoNo);

    Map<String, Object> addImages(String[] wasteInfo, MultipartFile[] uploadFiles, HttpServletRequest request);

    Integer insertReservation(List<Integer> selectedItems, Map<String, Object> imageAdd, Reservation reservationUserInfo, ReservationDetail reservationDetail, Pay pay);

    ReservationComplete selectReservationCompleteInfo(String payId);
}
