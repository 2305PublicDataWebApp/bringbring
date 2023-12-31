package com.bringbring.divide.domain;

import com.bringbring.chatting.domain.ChatRoom;
import com.bringbring.image.domain.Image;
import com.bringbring.region.domain.City;
import com.bringbring.region.domain.District;
import com.bringbring.reservation.domain.WasteCategory;
import com.bringbring.user.domain.User;
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
    private WasteCategory wasteCategory;
    private User user;
    private Heart heart;
    private ChatRoom chatRoom;

}
