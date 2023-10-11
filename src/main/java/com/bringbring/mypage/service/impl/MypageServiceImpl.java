package com.bringbring.mypage.service.impl;

import org.springframework.stereotype.Service;

import com.bringbring.mypage.service.MypageService;
import com.bringbring.mypage.store.MypageStore;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MypageServiceImpl implements MypageService{

	private final MypageStore mypageStore;
}
