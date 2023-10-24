package com.bringbring.reservation.domain;

import com.bringbring.image.domain.Image;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class MyPageImage {

    private Connection connection;
    private Image image;
}
