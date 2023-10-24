package com.bringbring.inquire.domain;

import com.bringbring.region.domain.City;
import com.bringbring.region.domain.District;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class InquireUpdate {

    private Inquire inquire;
    private City city;
    private District district;
}
