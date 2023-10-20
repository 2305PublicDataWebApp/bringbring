package com.bringbring.reservation.domain;

import com.bringbring.image.domain.Image;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ReservationComplete {

    private WasteData wasteData;
    private Reservation reservation;
    private ReservationDetail reservationDetail;
    private WasteCategory wasteCategory;
    private WasteType wasteType;
    private WasteInfo wasteInfo;
    private Pay pay;
    private Connection connection;
    private Image image;

}
