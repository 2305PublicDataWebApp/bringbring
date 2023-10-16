package com.bringbring.reservation.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Reservation {
    private int rvNo;
    private int userNo;
    private String rvAddr;
    private String rvPhone;
    private String rvRequest;
    private String rvName;
    private String rvAddrDetail;
    private LocalDateTime rvApplicationDate;
    private LocalDateTime rvRvDate;
    private char isRvCompletion;
    private char isRvCancel;
}
