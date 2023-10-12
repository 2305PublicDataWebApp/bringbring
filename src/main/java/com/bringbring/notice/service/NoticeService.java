package com.bringbring.notice.service;

import java.util.List;

import com.bringbring.notice.domain.Notice;
import com.bringbring.notice.domain.NoticePageInfo;

public interface NoticeService {

	/**
	 * 게시글 등록 Service
	 * @param notice
	 * @return
	 */
	int insertNotice(Notice notice);

	/**
	 * 게시글 전체 갯수 Service
	 * @return
	 */
	Integer getListCount();

	/**
	 * 게시글 목록 조회 Service
	 * @param noticeInfo
	 * @return
	 */
	List<Notice> selectNoticeList(NoticePageInfo noticeInfo);

	/**
	 * 게시글 번호에 맞는 게시글 상세 조회 Service
	 * @param noticeNo
	 * @return
	 */
	Notice selectNoticeByNo(Integer noticeNo);



}
