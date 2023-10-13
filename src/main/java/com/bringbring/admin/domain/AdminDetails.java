package com.bringbring.admin.domain;

import lombok.*;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AdminDetails {
    private int adminNo;
    private String userId;
    private String userPhone;
    private LocalDate adminCreateDate;
    private String regionName;
}