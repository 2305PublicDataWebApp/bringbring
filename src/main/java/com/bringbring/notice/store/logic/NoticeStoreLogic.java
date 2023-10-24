package com.bringbring.notice.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bringbring.common.PageInfo;
import com.bringbring.image.domain.Image;
import com.bringbring.notice.domain.Notice;
import com.bringbring.notice.store.NoticeStore;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class NoticeStoreLogic implements NoticeStore {

	private final SqlSession sqlSession;

	// 게시글 등록
	@Override
	public int insertNotice(Notice notice) {return sqlSession.insert("NoticeMapper.insertNotice", notice);}
	
	@Override
	public void insertImage(Image image) {sqlSession.insert("NoticeMapper.insertImage", image);}

	// 게시글 전체 갯수
	@Override
	public int selectListCount() {return sqlSession.selectOne("NoticeMapper.selectListCount");}
	// 서비스 전체 갯수
	@Override
	public int selectServiceCount() {return sqlSession.selectOne("NoticeMapper.selectServiceCount");}
	// 업데이트 전체 갯수
	@Override
	public int selectUpdateCount() {return sqlSession.selectOne("NoticeMapper.selectUpdateCount");}
	

	// 게시글 목록 조회
	@Override
	public List<Notice> selectNoticeList(PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList("NoticeMapper.selectNoticeList", null, rowBounds);}	
	// 서비스 목록 조회
	@Override
	public List<Notice> selectServiceList(PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList("NoticeMapper.selectServiceList", null, rowBounds);}
	// 업데이트 목록 조회
	@Override
	public List<Notice> selectUpdateList(PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList("NoticeMapper.selectUpdateList", null, rowBounds);}

	
	// 게시글 번호에 맞는 게시글 상세 조회
	@Override
	public Notice selectNoticeByNo(Integer noticeNo) {
		sqlSession.update("NoticeMapper.updateViewCount", noticeNo);
		return sqlSession.selectOne("NoticeMapper.selectNoticeByNo", noticeNo);
	}

	// 게시글 삭제
	@Override
	public int deleteNotice(Integer noticeNo) {return sqlSession.update("NoticeMapper.deleteNotice", noticeNo);}

	// 게시글 수정
	@Override
	public int updateNotice(Notice notice) {return sqlSession.update("NoticeMapper.updateNotice", notice);}

	// 이전글 다음글 구현
	@Override
	public Map<String, Object> selectpreNextInfo(Integer noticeNo) {
		return sqlSession.selectOne("NoticeMapper.selectpreNextInfo",noticeNo);
	}

	// 검색 게시글 갯수
	@Override
	public int selectListCount(String searchKeyword) {return sqlSession.selectOne("NoticeMapper.selectListByKeywordCount", searchKeyword);}
	@Override
	public int selectServiceListCount(String searchKeyword) {return sqlSession.selectOne("NoticeMapper.selectServiceListByKeywordCount", searchKeyword);}
	@Override
	public int selectUpdateListCount(String searchKeyword) {return sqlSession.selectOne("NoticeMapper.selectUpdateListByKeywordCount", searchKeyword);}
	
	// 키워드 검색
	@Override
	public List<Notice> searchNoticeByKeyword(PageInfo pInfo, String searchKeyword) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList("NoticeMapper.searchNoticeByKeyword", searchKeyword, rowBounds);
	}
	@Override
	public List<Notice> searchServiceByKeyword(PageInfo pInfo, String searchKeyword) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList("NoticeMapper.searchServiceByKeyword", searchKeyword, rowBounds);
	}
	@Override
	public List<Notice> searchUpdateByKeyword(PageInfo pInfo, String searchKeyword) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList("NoticeMapper.searchUpdateByKeyword", searchKeyword, rowBounds);
	}

	@Override
	public Image selectImageByNo(Integer noticeNo) {
		return sqlSession.selectOne("NoticeMapper.selectImageByNo",noticeNo);
	}














}
