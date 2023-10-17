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
public class ReportDetails {

    private int repNo;
    private int divNo;
    private int userNo;
    private String repCategory;
    private String repContent;
    private LocalDateTime repCreateDate;
    private LocalDateTime repUpdateDate;
    private char isRepDeleted;
    private String divTitle;
    private String divContent;
    private int wasteCategoryNo;
    private LocalDateTime divCreateDate;
    private LocalDateTime divUpdateDate;
    private char divYn;
    private int viewCount;
    private char isDivDeleted;
    private int cityNo;
    private int districtNo;
    private String divXCoordinate;
    private String divYCoordinate;
    private int heartCount;
    private String userId;
}
