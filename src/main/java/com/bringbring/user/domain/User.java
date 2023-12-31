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
	private String sendUserId;
	private String getUserId;
	private String userPwd;
	private String userName;
	private String sendUserName;
	private String getUserName;
	private String userPhone;
	private String userPostCode;
	private String userAddress;
	private String userAddressDetail;
	private LocalDate userCreateDate;
	private String userProfileName;
	private String userProfileRename;
	private String userProfilePath;
	private long userProfileLength;
	private char isUserDeleted;
	
	public User(String userId, String userPwd, String userName) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
	}
	
}
