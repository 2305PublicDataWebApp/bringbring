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
public class Pay {
    private int payNo;
    private int rvDetailNo;
    private String userId;
    private String payId;
    private String payMethod;
    private long payAmount;
    private String payCurrency;
    private Date payDate;
    private char isPayStatus;
    private char isPayCancel;


}
