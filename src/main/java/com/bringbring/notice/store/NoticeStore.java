package com.bringbring.notice.store;

import java.util.List;
import java.util.Map;

import com.bringbring.common.PageInfo;
import com.bringbring.image.domain.Image;
import com.bringbring.notice.domain.Notice;

public interface NoticeStore {

	/**
	 * 공지사항 등록 Store
	 * 
	 * @param notice
	 * @return
	 */
	int insertNotice(Notice notice);

	void insertImage(Image image);
	/**
	 * 게시글 전체 갯수 Store
	 * 
	 * @return
	 */
	int selectListCount();
	// 서비스 전체 갯수
	int selectServiceCount();
	// 업데이트 전체 갯수
	int selectUpdateCount();

	/**
	 * 게시글 목록 조회 Store
	 * 
	 * @param pInfo
	 * @return
	 */
	List<Notice> selectNoticeList(PageInfo pInfo);
	// 서비스 목록 조회
	List<Notice> selectServiceList(PageInfo pInfo);
	// 업데이트 목록 조회
	List<Notice> selectUpdateList(PageInfo pInfo);
	
	/**
	 * 게시글 번호에 맞는 게시글 상세 조회 Store
	 * 
	 * @param noticeNo
	 * @return
	 */
	Notice selectNoticeByNo(Integer noticeNo);

	/**
	 * 게시글 삭제 Store
	 * 
	 * @param notice
	 * @return
	 */
	int deleteNotice(Integer noticeNo);

	/**
	 * 게시글 수정 Store
	 * 
	 * @param notice
	 * @return
	 */
	int updateNotice(Notice notice);


	/**
	 * 이전글 다음글 구현
	 * @param noticeNo
	 * @return
	 */
	Map<String, Object> selectpreNextInfo(Integer noticeNo);

	/**
	 * 검색 게시글 갯수
	 * @param paramMap
	 * @return
	 */
	int selectListCount(String searchKeyword);
	int selectServiceListCount(String searchKeyword);
	int selectUpdateListCount(String searchKeyword);

	/**
	 * 키워드 검색
	 * @param pInfo
	 * @param paramMap
	 * @return
	 */
	List<Notice> searchNoticeByKeyword(PageInfo pInfo, String searchKeyword);
	List<Notice> searchServiceByKeyword(PageInfo pInfo, String searchKeyword);
	List<Notice> searchUpdateByKeyword(PageInfo pInfo, String searchKeyword);















}
