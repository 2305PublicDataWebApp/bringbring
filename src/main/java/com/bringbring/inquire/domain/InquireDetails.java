package com.bringbring.inquire.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class InquireDetails {
    private int inqNo;
    private int userNo;
    private String userId;
    private String inqTitle;
    private String userName;
    private LocalDateTime inqCreateDate;
    private char answerYn;
    private int cityNo;
    private int districtNo;
    private String inqCategory;
    private String cityName;
}
