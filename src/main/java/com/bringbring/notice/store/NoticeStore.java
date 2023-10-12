package com.bringbring.notice.store;

import java.util.List;

import com.bringbring.notice.domain.Notice;
import com.bringbring.notice.domain.PageInfo;

public interface NoticeStore {

	/**
	 * 공지사항 등록 Store
	 * @param notice
	 * @return
	 */
	int insertNotice(Notice notice);

	/** 
	 * 게시글 전체 갯수 Store
	 * @return
	 */
	int selectListCount();

	/**
	 * 게시글 목록 조회 Store
	 * @param noticeInfo
	 * @return
	 */
	List<Notice> selectNoticeByList(PageInfo noticeInfo);

	/**
	 * 게시글 번호에 맞는 게시글 상세 조회 Store
	 * @param noticeNo
	 * @return
	 */
	Notice selectNoticeByNo(Integer noticeNo);

}
