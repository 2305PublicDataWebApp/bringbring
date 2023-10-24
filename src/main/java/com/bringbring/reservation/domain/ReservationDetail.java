package com.bringbring.reservation.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ReservationDetail {
    private int rvDetailNo;
    private int rvNo;
    private int rvDetailTotal;
    private int rvDetailFee;
}
