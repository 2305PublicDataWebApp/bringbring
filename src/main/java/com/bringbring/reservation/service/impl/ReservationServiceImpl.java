package com.bringbring.reservation.service.impl;

import com.bringbring.reservation.domain.WasteCategory;
import com.bringbring.reservation.domain.WasteData;
import com.bringbring.reservation.service.ReservationService;
import com.bringbring.reservation.store.ReservationStore;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@RequiredArgsConstructor
@Transactional
@Service
public class ReservationServiceImpl implements ReservationService {

    private final ReservationStore reservationStore;

    @Override
    @Transactional(readOnly = true)
    public List<WasteData> selectWasteList(String selectItem) {
        return this.reservationStore.selectWasteList(selectItem);
    }

    @Override
    @Transactional(readOnly = true)
    public List<WasteCategory> selectWasteCategoryList() {
        return reservationStore.selectWasteCategoryList();
    }

    @Override
    public WasteData selectInfoNoData(Integer wasteInfoNo) {
        return reservationStore.selectInfoNoData(wasteInfoNo);
    }
}
