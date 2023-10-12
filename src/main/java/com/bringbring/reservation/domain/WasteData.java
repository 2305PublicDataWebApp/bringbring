package com.bringbring.reservation.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class WasteData {
    private WasteCategory wasteCategory;
    private WasteType wasteType;
    private WasteInfo wasteInfo;

}
