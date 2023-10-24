package com.bringbring.reservation.domain;

import com.bringbring.image.domain.Image;
import com.bringbring.region.domain.City;
import com.bringbring.region.domain.District;
import com.bringbring.region.domain.Region;
import com.bringbring.user.domain.User;
import lombok.*;

import java.sql.Date;
import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ReservationAdmin {
    private Reservation reservation;
    private ReservationDetail reservationDetail;
    private WasteCategory wasteCategory;
    private WasteType wasteType;
    private WasteInfo wasteInfo;
    private Pay pay;
    private Connection connection;
    private Image image;
    private City city;
    private District district;
    private User user;
    private Region region;
}
