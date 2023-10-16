package com.bringbring.report.store.logic;

import com.bringbring.report.domain.Report;
import com.bringbring.report.store.ReportStore;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class ReportStoreLogic implements ReportStore {

    private final SqlSession sqlSession;

    @Override
    public int insertReport(Report report) { return sqlSession.insert("reportMapper.insertReport", report); }
}
