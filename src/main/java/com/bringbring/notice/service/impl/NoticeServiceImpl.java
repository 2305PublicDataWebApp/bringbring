package com.bringbring.notice.service.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.bringbring.common.PageInfo;
import com.bringbring.image.domain.Image;
import com.bringbring.notice.domain.Notice;
import com.bringbring.notice.service.NoticeService;
import com.bringbring.notice.store.NoticeStore;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {

	private final NoticeStore noticeStore;

	// 게시글 등록
	@Override
	public int insertNotice(Notice notice) {return noticeStore.insertNotice(notice);}

	// 게시글 전체 갯수
	@Override
	public Integer getListCount() {return noticeStore.selectListCount();}
	// 서비스 전체 갯수
	@Override
	public Integer getServiceListCount() {return noticeStore.selectServiceCount();}
	// 업데이트 전체 갯수
	@Override
	public Integer getUpdateListCount() {return noticeStore.selectUpdateCount();}

	
	// 게시글 목록 조회
	@Override
	public List<Notice> selectNoticeList(PageInfo pInfo) {return noticeStore.selectNoticeList(pInfo);}
	// 서비스 목록 조회
	@Override
	public List<Notice> selectServiceList(PageInfo sInfo) {return noticeStore.selectServiceList(sInfo);}
	// 업데이트 목록 조회
	@Override
	public List<Notice> selectUpdateList(PageInfo uInfo) {return noticeStore.selectUpdateList(uInfo);}
	
		
	// 게시글 번호에 맞는 게시글 상세 조회
	@Override
	public Notice selectNoticeByNo(Integer noticeNo) {return noticeStore.selectNoticeByNo(noticeNo);}


	// 게시글 삭제
	@Override
	public int deleteNotice(Integer noticeNo) {return noticeStore.deleteNotice(noticeNo);}


	@Override
	public Map<String, Object> selectpreNextInfo(Integer noticeNo) {
		return noticeStore.selectpreNextInfo(noticeNo);
	}

	// 게시글 수정
	@Override
	public int updateNotice(Notice notice) {return noticeStore.updateNotice(notice);}

	// 검색 게시글 갯수
	@Override
	public int getListCount(String searchKeyword) {return noticeStore.selectListCount(searchKeyword);}

	// 키워드 검색
	@Override
	public List<Notice> searchNoticeByKeyword(PageInfo pInfo, String searchKeyword) {return noticeStore.searchNoticeByKeyword(pInfo, searchKeyword);}




	





		


}
