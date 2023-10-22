package com.bringbring.notice.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.bringbring.common.PageInfo;
import com.bringbring.image.domain.Image;
import com.bringbring.notice.domain.Notice;

public interface NoticeService {

	/**
	 * 게시글 등록 Service
	 * @param notice
	 * @param uploadFile
	 * @param request
	 * @return
	 */
	int insertNotice(Notice notice);

	/**
	 * 게시글 전체 갯수 Service
	 * 
	 * @return
	 */
	Integer getListCount();
	// 서비스 갯수
	Integer getServiceListCount();
	// 업데이트 갯수
	Integer getUpdateListCount();

	/**
	 * 게시글 목록 조회 Service
	 * 
	 * @param pInfo
	 * @return
	 */
	List<Notice> selectNoticeList(PageInfo pInfo);
	// 서비스 목록
	List<Notice> selectServiceList(PageInfo sInfo);
	// 업데이트 목록
	List<Notice> selectUpdateList(PageInfo uInfo);
	

	/**
	 * 게시글 번호에 맞는 게시글 상세 조회 Service
	 * 
	 * @param noticeNo
	 * @return
	 */
	Notice selectNoticeByNo(Integer noticeNo);
	
	/**
	 * 이전글과 다음글
	 * @param noticeNo
	 * @return
	 */
	Map<String, Object> selectpreNextInfo(Integer noticeNo);

	/**
	 * 게시글 수정 Service
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
	int deleteNotice(Integer noticeNo);


	/**
	 * 검색 게시글 갯수
	 * @param paramMap
	 * @return
	 */
	int getListCount(String searchKeyword);

	/**
	 * 키워드 검색
	 * @param pInfo
	 * @param paramMap
	 * @return
	 */
	List<Notice> searchNoticeByKeyword(PageInfo pInfo, String searchKeyword);













	




}
