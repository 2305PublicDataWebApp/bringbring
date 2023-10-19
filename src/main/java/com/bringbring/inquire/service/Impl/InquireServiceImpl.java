package com.bringbring.inquire.service.Impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bringbring.inquire.domain.Inquire;
import com.bringbring.inquire.service.InquireService;
import com.bringbring.inquire.store.InquireStore;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class InquireServiceImpl implements InquireService {

	private final InquireStore inquireStore;
	
	@Override
	public List<Inquire> selectInquireListByUserNo(int userNo) {
		return inquireStore.selectInquireListByUserNo(userNo);
	}

}
