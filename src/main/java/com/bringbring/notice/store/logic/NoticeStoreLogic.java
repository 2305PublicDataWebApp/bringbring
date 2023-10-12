package com.bringbring.notice.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bringbring.notice.domain.Notice;
import com.bringbring.notice.store.NoticeStore;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class NoticeStoreLogic implements NoticeStore{

	private final SqlSession sqlSession;

	@Override
	public int insertNotice(Notice notice) {
		return sqlSession.insert("NoticeMapper.insertNotice", notice);
	}
}
