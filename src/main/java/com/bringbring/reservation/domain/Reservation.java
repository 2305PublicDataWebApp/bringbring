package com.bringbring.reservation.domain;

import lombok.*;

import java.sql.Date;
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
//    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDateTime rvApplicationDate;
//    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @NonNull
    private Date rvRvDate;
    private char isRvCompletion;
    private char isRvCancel;
}
