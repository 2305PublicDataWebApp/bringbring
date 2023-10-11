package com.bringbring.reservation.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class WasteType {
    private int wasteTypeNo;
    private String wasteTypeName;
    private int wasteCategoryNo;
}
