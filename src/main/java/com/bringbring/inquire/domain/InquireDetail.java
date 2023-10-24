package com.bringbring.inquire.domain;

import com.bringbring.region.domain.City;
import com.bringbring.region.domain.District;
import com.bringbring.user.domain.User;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class InquireDetail {

    private Inquire inquire;
    private City city;
    private District district;
    private Answer answer;
    private User user;
}
