package com.bringbring.region.domain;

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
public class Region {
	private int regionNo;
	private int ciryNo;
	private int districtNo;
	private String regionName;
}
