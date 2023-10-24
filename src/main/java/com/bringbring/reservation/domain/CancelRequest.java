package com.bringbring.reservation.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CancelRequest {

    private Reservation reservation;
    private ReservationDetail reservationDetail;
    private Pay pay;
}
