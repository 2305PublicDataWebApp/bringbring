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
public class Answer {
    private int ansNo;
    private int inqNo;
    private String ansContent;
    private LocalDateTime ansCreateDate;
    private LocalDateTime ansUpdateDate;
    private int AdminNO;
}
