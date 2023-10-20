package com.bringbring.report.service;

import com.bringbring.common.PageInfo;
import com.bringbring.report.domain.Report;
import com.bringbring.report.domain.ReportDetails;

import java.util.List;
import java.util.Map;

public interface ReportService {
    /**
     * 신고하기 service
     * @param report
     * @return int
     */
    int insertReport(Report report);

    /**
     * 전체 신고수 조회 service
     * @return int
     */
    int selectReportCount();

    /**
     * 전체 신고 리스트 조회 service
     * @param pInfo
     * @return
     */
    List<ReportDetails> selectReportList(PageInfo pInfo);

    /**
     * 신고 게시글 삭제 service
     * @param reportDetails
     * @return
     */
    int deleteDivide(ReportDetails reportDetails);

    /**
     * 신고 테이블 삭제 service
     * @param reportDetails
     * @return int
     */
    int deleteReport(ReportDetails reportDetails);

    /**
     * 삭제된 신고 게시물 갯수 조회 service
     * @return int
     */
    int slectDeleteRepCount();

    /**
     * 신고 게시물 검색 service
     * @param pInfo
     * @param paramMap
     * @return int
     */
    List<ReportDetails> searchReportByKeyword(PageInfo pInfo, Map<String, String> paramMap);

    /**
     * 신고 게시물 검색된 갯수 조회 service
     * @param paramMap
     * @return int
     */
    int getListReportCount(Map<String, String> paramMap);

    /**
     * 게시글 번호로 신고글 조회 service
     * @param divNo
     * @return
     */
    List<ReportDetails> getReportDetailsByDivNo(int divNo);
}
