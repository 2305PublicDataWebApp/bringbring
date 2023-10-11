package com.bringbring.divide.domain;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Divide {
	
	private int divNo;
	private int userNo;
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
}
