package com.bringbring.divide.domain;

import com.bringbring.region.domain.City;
import com.bringbring.region.domain.District;
import com.bringbring.reservation.domain.WasteCategory;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UpdateData {

    private Divide divide;
    private City city;
    private District district;
    private WasteCategory wasteCategory;

}
