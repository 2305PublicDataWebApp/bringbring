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
public class User {

	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String userPhone;
	private String userPostCode;
	private String userAddress;
	private String userAddressDetail;
	private LocalDate userCreateDate;
	private String userProfileName;
	private String userProfileRename;
	private String userProfilePath;
	private int userProfileLength;
	private char isUserDeleted;
}
