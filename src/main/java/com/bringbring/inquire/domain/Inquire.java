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
public class Inquire {

    private int inqNo;
    private int userNo;
    private String inqTitle;
    private String inqContent;
    private LocalDateTime inqCreateDate;
    private LocalDateTime inqUpdateDate;
    private char answerYn;
    private char isInqDeleted;
    private String inqCategory;
    private int cityNo;
    private int districtNo;
}
