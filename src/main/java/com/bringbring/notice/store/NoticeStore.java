package com.bringbring.notice.store;

import com.bringbring.notice.domain.Notice;

public interface NoticeStore {

	/**
	 * 공지사항 등록 Store
	 * @param notice
	 * @return
	 */
	int insertNotice(Notice notice);

}
