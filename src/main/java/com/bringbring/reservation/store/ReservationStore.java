package com.bringbring.reservation.store;

import com.bringbring.reservation.domain.WasteCategory;
import com.bringbring.reservation.domain.WasteData;

import java.util.List;

public interface ReservationStore {
    List<WasteData> selectWasteList(String selectItem);

    List<WasteCategory> selectWasteCategoryList();

    WasteData selectInfoNoData(Integer wasteInfoNo);
}
