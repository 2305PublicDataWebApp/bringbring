package com.bringbring.reservation.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class WasteInfo {
    private int wasteInfoNo;
    private int wasteTypeNo;
    private String wasteInfoStandard;
    private int wasteInfoFee;
}
