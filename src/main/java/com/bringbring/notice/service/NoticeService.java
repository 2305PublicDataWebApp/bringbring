package com.bringbring.notice.service;

import java.util.List;
import java.util.Map;

import com.bringbring.common.PageInfo;
import com.bringbring.notice.domain.Notice;

public interface NoticeService {

	/**
	 * 게시글 등록 Service
	 * 
	 * @param notice
	 * @return
	 */
	int insertNotice(Notice notice);

	/**
	 * 게시글 전체 갯수 Service
	 * 
	 * @return
	 */
	Integer getListCount();

	/**
	 * 게시글 목록 조회 Service
	 * 
	 * @param pInfo
	 * @return
	 */
	List<Notice> selectNoticeList(PageInfo pInfo);

	/**
	 * 게시글 번호에 맞는 게시글 상세 조회 Service
	 * 
	 * @param noticeNo
	 * @return
	 */
	Notice selectNoticeByNo(Integer noticeNo);

	/**
	 * 게시글 수정 Service
	 * 
	 * @param notice
	 * @return
	 */
	int updateNotice(Notice notice);

	/**
	 * 게시글 삭제 Service
	 * 
	 * @param notice
	 * @return
	 */
	int deleteNotice(Notice notice);

}
