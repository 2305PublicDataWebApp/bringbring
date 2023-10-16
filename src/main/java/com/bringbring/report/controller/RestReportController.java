package com.bringbring.report.controller;

import com.bringbring.report.domain.Report;
import com.bringbring.report.service.ReportService;
import com.bringbring.user.domain.User;
import com.bringbring.user.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
@RequiredArgsConstructor
@RequestMapping("/report")
public class RestReportController {

    private final UserService userService;
    private final ReportService reportService;

    @PostMapping("/insert.do")
    public String insertReport(Report report
            , HttpSession httpSession) {
        User user = userService.selectOneById((String)httpSession.getAttribute("sessionId"));
        report.setUserNo(user.getUserNo());
        int result = reportService.insertReport(report);
        if(result > 0){
            return "success";
        }else{
            return "false";
        }
    }
}
