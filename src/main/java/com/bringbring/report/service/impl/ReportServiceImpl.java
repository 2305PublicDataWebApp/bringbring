package com.bringbring.report.service.impl;

import com.bringbring.report.domain.Report;
import com.bringbring.report.service.ReportService;
import com.bringbring.report.store.ReportStore;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
@RequiredArgsConstructor
public class ReportServiceImpl implements ReportService {

    private final ReportStore reportStore;

    @Override
    public int insertReport(Report report) { return reportStore.insertReport(report); }
}
