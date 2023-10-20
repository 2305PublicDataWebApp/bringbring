package com.bringbring.report.store.logic;

import com.bringbring.common.PageInfo;
import com.bringbring.report.domain.Report;
import com.bringbring.report.domain.ReportDetails;
import com.bringbring.report.store.ReportStore;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class ReportStoreLogic implements ReportStore {

    private final SqlSession sqlSession;

    @Override
    public int insertReport(Report report) { return sqlSession.insert("reportMapper.insertReport", report); }

    @Override
    public int selectReportCount() { return sqlSession.selectOne("reportMapper.selectReportCount");}

    @Override
    public List<ReportDetails> selectReportList(PageInfo pInfo) {
        int limit = pInfo.getRecordCountPerPage();
        int offset = (pInfo.getCurrentPage()-1)*limit;
        RowBounds rowBounds = new RowBounds(offset, limit);
        return sqlSession.selectList("reportMapper.selectReportList", null, rowBounds);
    }

    @Override
    public int deleteDivide(ReportDetails reportDetails) { return sqlSession.update("reportMapper.deleteDivide", reportDetails);}

    @Override
    public int deleteReport(ReportDetails reportDetails) { return sqlSession.update("reportMapper.deleteReport", reportDetails); }

    @Override
    public int slectDeleteRepCount() { return sqlSession.selectOne("reportMapper.slectDeleteRepCount"); }

    @Override
    public List<ReportDetails> searchReportByKeyword(PageInfo pInfo, Map<String, String> paramMap) {
        int limit = pInfo.getRecordCountPerPage();
        int offset = (pInfo.getCurrentPage() - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);
        return sqlSession.selectList("reportMapper.searchReportByKeyword", paramMap, rowBounds);
    }

    @Override
    public int getListReportCount(Map<String, String> paramMap) {
        return sqlSession.selectOne("reportMapper.getListReportCount", paramMap);
    }

    @Override
    public List<ReportDetails> getReportDetailsByDivNo(int divNo) {
        return sqlSession.selectList("reportMapper.getReportDetailsByDivNo", divNo);
    }
}

