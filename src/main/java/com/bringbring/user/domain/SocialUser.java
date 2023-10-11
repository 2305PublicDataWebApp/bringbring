package com.bringbring.user.domain;

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
public class SocialUser {
	
	private int socialNo;
	private String socialAccessToken;
	private String socialRefreshToken;
	private String socialType;
}
