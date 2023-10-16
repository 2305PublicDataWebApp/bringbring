package com.bringbring.reservation.service;

import com.bringbring.reservation.domain.WasteCategory;
import com.bringbring.reservation.domain.WasteData;
import com.bringbring.reservation.domain.WasteInfo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public interface ReservationService {
    List<WasteData> selectWasteList(String selectItem);

    List<WasteCategory> selectWasteCategoryList();

    WasteData selectInfoNoData(Integer wasteInfoNo);

    Map<String, Object> insertImages(WasteInfo wasteInfo, MultipartFile[] uploadFiles, HttpServletRequest request);
}
