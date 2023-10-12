package com.bringbring.notice.service;

import com.bringbring.notice.domain.Notice;

public interface NoticeService {

	/**
	 * 공지사항 등록 Service
	 * @param notice
	 * @return
	 */
	int insertNotice(Notice notice);



}
