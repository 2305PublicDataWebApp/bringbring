package com.bringbring.report.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Report {

    private int repNo;
    private int divNo;
    private int userNo;
    private String repCategory;
    private String repContent;
    private LocalDateTime repCreateDate;
    private LocalDateTime repUpdateDate;
    private char isRepDeleted;
}
