package com.bringbring.reservation.service;

import com.bringbring.reservation.domain.WasteData;

import java.util.List;

public interface ReservationService {
    List<WasteData> selectWasteList(String selectItem);
}
