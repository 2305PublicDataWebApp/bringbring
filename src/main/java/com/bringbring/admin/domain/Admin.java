package com.bringbring.admin.domain;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Admin {
	private int adminNo;
	private int userNo;
	private String managedRegion;
	private String managedOrganization;
	private int adminGrade;
	private LocalDate adminCreateDate; 
}
