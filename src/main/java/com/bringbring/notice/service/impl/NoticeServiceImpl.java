package com.bringbring.notice.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bringbring.notice.domain.Notice;
import com.bringbring.notice.domain.PageInfo;
import com.bringbring.notice.service.NoticeService;
import com.bringbring.notice.store.NoticeStore;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService{
	
	private final NoticeStore noticeStore;
	
	// 게시글 등록
	@Override
	public int insertNotice(Notice notice) {
		int result = noticeStore.insertNotice(notice);
		return result;
	}
	
	// 게시글 전체 갯수
	@Override
	public Integer getListCount() {
		int result = noticeStore.selectListCount();
		return result;
	}
	
	// 게시글 목록 조회
	@Override
	public List<Notice> selectNoticeList(PageInfo noticeInfo) {
		List<Notice> noticeList = noticeStore.selectNoticeByList(noticeInfo);
		return noticeList;
	}
	
	// 게시글 번호에 맞는 게시글 상세 조회
	@Override
	public Notice selectNoticeByNo(Integer noticeNo) {
		Notice notice = noticeStore.selectNoticeByNo(noticeNo);
		return notice;
	}



	
}
