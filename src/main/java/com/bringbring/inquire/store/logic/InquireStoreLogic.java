package com.bringbring.inquire.store.logic;

import com.bringbring.common.PageInfo;
import com.bringbring.inquire.domain.Inquire;
import com.bringbring.inquire.domain.InquireDetails;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.bringbring.inquire.store.InquireStore;
import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class InquireStoreLogic implements InquireStore{

    private final SqlSession sqlSession;
    @Override
    public int selectInqListCount() { return sqlSession.selectOne("InquireMapper.selectInqListCount"); }

    @Override
    public int searchInqListCount(Map<String, String> paramMap) { return sqlSession.selectOne("InquireMapper.searchInqListCount", paramMap) ; }

    @Override
    public List<InquireDetails> selectInquireList(PageInfo pInfo) {
        int limit = pInfo.getRecordCountPerPage();
        int offset = (pInfo.getCurrentPage() - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);
        return sqlSession.selectList("InquireMapper.selectInquireList", null, rowBounds);
    }

    @Override
    public List<InquireDetails> selectInquiriesByAnswer(InquireDetails inquireDetails, PageInfo pInfo) {
        int limit = pInfo.getRecordCountPerPage();
        int offset = (pInfo.getCurrentPage() - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);
        return sqlSession.selectList("InquireMapper.selectInquiriesByAnswer", inquireDetails, rowBounds);
    }

    @Override
    public List<InquireDetails> selectInquireByCityNo(InquireDetails inquireDetails, PageInfo pInfo) {
        int limit = pInfo.getRecordCountPerPage();
        int offset = (pInfo.getCurrentPage() - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);
        return sqlSession.selectList("InquireMapper.selectInquireByCityNo", inquireDetails, rowBounds);
    }

    @Override
    public int selectInquireCount(char answerYn) { return sqlSession.selectOne("InquireMapper.selectInquireCount", answerYn); }

    @Override
    public int selectInquireCountByCity(int cityNo) { return sqlSession.selectOne("InquireMapper.selectInquireCountByCity", cityNo ); }

    @Override
    public List<InquireDetails> searchInquireByKeyword(PageInfo pInfo, Map<String, String> paramMap) {
        int limit = pInfo.getRecordCountPerPage();
        int offset = (pInfo.getCurrentPage() - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);
        return sqlSession.selectList("InquireMapper.searchInquireByKeyword", paramMap, rowBounds);
    }

   	@Override
	  public List<Inquire> selectInquireListByUserNo(int userNo) { return sqlSession.selectList("InquireMapper.selectInquireListByUserNo",userNo); }

}
