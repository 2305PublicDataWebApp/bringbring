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
public class District {
	private int districtNo;
	private String districtName;
	private int cityNo;

	private int regionNo;
}
