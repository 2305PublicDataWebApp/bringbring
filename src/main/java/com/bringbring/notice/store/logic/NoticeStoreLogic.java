package com.bringbring.notice.store.logic;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bringbring.notice.domain.Notice;
import com.bringbring.notice.domain.PageInfo;
import com.bringbring.notice.store.NoticeStore;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class NoticeStoreLogic implements NoticeStore{

	private final SqlSession sqlSession;

	// 게시글 등록
	@Override
	public int insertNotice(Notice notice) {
		return sqlSession.insert("NoticeMapper.insertNotice", notice);
	}

	// 게시글 전체 갯수
	@Override
	public int selectListCount() {
		return sqlSession.selectOne("NoticeMapper.selectNoticeList");
	}

	// 게시글 목록 조회
	@Override
	public List<Notice> selectNoticeByList(PageInfo noticeInfo) {
		int limit = noticeInfo.getRecordCountPerPage();
		int offset = (noticeInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList("NoticeMapper.selectNoticeByList", noticeInfo);
	}

	// 게시글 번호에 맞는 게시글 상세 조회
	@Override
	public Notice selectNoticeByNo(Integer noticeNo) {
		return sqlSession.selectOne("NoticeMapper.selectNoticeByNo", noticeNo);
	}
}
