package com.bringbring.report.service.impl;

import com.bringbring.common.PageInfo;
import com.bringbring.report.domain.Report;
import com.bringbring.report.domain.ReportDetails;
import com.bringbring.report.service.ReportService;
import com.bringbring.report.store.ReportStore;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional
@RequiredArgsConstructor
public class ReportServiceImpl implements ReportService {

    private final ReportStore reportStore;

    @Override
    public int insertReport(Report report) { return reportStore.insertReport(report); }

    @Override
    public int selectReportCount() { return reportStore.selectReportCount(); }

    @Override
    public List<ReportDetails> selectReportList(PageInfo pInfo) { return reportStore.selectReportList(pInfo); }

    @Override
    public int deleteDivide(ReportDetails reportDetails) {
        int result = reportStore.deleteDivide(reportDetails);
        if(result>0){
            int reportResult = deleteReport(reportDetails);
            if(reportResult>0) {
                return result;
            } else {
                throw new RuntimeException("신고 테이블 삭제에 실패하였습니다.");
            }
        } else {
            throw new RuntimeException("게시글 삭제에 실패하였습니다.");
        }
    }

    @Override
    public int deleteReport(ReportDetails reportDetails) { return reportStore.deleteReport(reportDetails); }

    @Override
    public int slectDeleteRepCount() { return reportStore.slectDeleteRepCount(); }

    @Override
    public List<ReportDetails> searchReportByKeyword(PageInfo pInfo, Map<String, String> paramMap) { return reportStore.searchReportByKeyword(pInfo, paramMap); }

    @Override
    public int getListReportCount(Map<String, String> paramMap) { return reportStore.getListReportCount(paramMap); }

    @Override
    public List<ReportDetails> getReportDetailsByDivNo(int divNo) { return reportStore.getReportDetailsByDivNo(divNo); }
}
