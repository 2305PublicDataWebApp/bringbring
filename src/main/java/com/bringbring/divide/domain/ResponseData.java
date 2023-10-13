package com.bringbring.divide.domain;

import com.bringbring.image.domain.Image;
import com.bringbring.region.domain.City;
import com.bringbring.region.domain.District;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ResponseData {

    private Image image;
    private Divide divide;
    private City city;
    private District district;

}
