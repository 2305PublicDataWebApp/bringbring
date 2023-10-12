package com.bringbring.notice.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bringbring.notice.domain.Notice;
import com.bringbring.notice.service.NoticeService;
import com.bringbring.notice.store.NoticeStore;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService{
	
	private final NoticeStore noticeStore;
	@Override
	public int insertNotice(Notice notice) {
		int result = noticeStore.insertNotice(notice);
		return result;
	}



	
}
