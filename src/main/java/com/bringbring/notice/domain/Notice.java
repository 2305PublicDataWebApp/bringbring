package com.bringbring.notice.domain;

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
public class Notice {

	private int noticeNo;
	private String noticeType;
	private String noticeTitle;
	private String noticeContent;
	private LocalDate noticeCreateDate;
	private int noticeViewCount;
	private char isNoticeDeleted;
	private int preNoticeNo;
	private int nextNoticeNo;
	private int adminNo;
	
}
