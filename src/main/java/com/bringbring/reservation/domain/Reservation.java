package com.bringbring.reservation.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Reservation {
    private int rvNo;
    private String rvDischargeNo;
    private int userNo;
    private int cityNo;
    private int districtNo;
    private String rvAddr;
    private String rvPhone;
    private String rvRequest;
    private String rvName;
    private String rvAddrDetail;
    private Date rvApplicationDate;
    //    @NonNull
    private Date rvRvDate;
    private char isRvCompletion;
    private char isRvCancel;
    private int cityNo;
    private int districtNo;
}



//    @DateTimeFormat(pattern = "yyyy-MM-dd")
//    @DateTimeFormat(pattern = "yyyy-MM-dd")
