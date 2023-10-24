package com.bringbring.admin.controller;

import com.bringbring.admin.domain.Admin;
import com.bringbring.admin.service.AdminService;
import com.bringbring.common.PageInfo;
import com.bringbring.inquire.domain.InquireDetails;
import com.bringbring.inquire.service.InquireService;
import com.bringbring.region.domain.District;
import com.bringbring.report.domain.ReportDetails;
import com.bringbring.report.service.ReportService;
import com.bringbring.reservation.domain.ReservationAdmin;
import com.bringbring.reservation.service.ReservationService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/admin")
@RequiredArgsConstructor
public class RestAdminController {

    private final InquireService inquireService;
    private final AdminController adminController;
    private final ReportService reportService;
    private final AdminService adminService;

    //문의글 답변 유무에 따른 리스트
    @PostMapping("/inquireAnswer.do")
    public ResponseEntity<Map<String, Object>> selectInquiriesByAnswer(@ModelAttribute InquireDetails inquireDetails
            , @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
            , HttpSession session) {
        int checkAdmin = (int) session.getAttribute("sessionUserGrade");
        if (checkAdmin >= 2) {
            int inquireCount = inquireService.selectInquireCount(inquireDetails.getAnswerYn());
            PageInfo pInfo = adminController.getPageInfo(currentPage, inquireCount);
            List<InquireDetails> result = inquireService.selectInquiriesByAnswer(inquireDetails, pInfo);

            Map<String, Object> response = new HashMap<>();
            response.put("pageInfo", pInfo);
            response.put("inqList", result);

            return ResponseEntity.ok(response);
        } else {
            return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
        }
    }
    //지역별 문의 리스트
    @PostMapping("/inquireCity.do")
    public ResponseEntity<Map<String, Object>> selectInquireByCity(@ModelAttribute InquireDetails inquireDetails
            , @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
            , HttpSession session) {

        int checkAdmin = (int) session.getAttribute("sessionUserGrade");
        if (checkAdmin >= 2) {
            int inquireCount = inquireService.selectInquireCountByCity(inquireDetails.getCityNo());
            PageInfo pInfo = adminController.getPageInfo(currentPage, inquireCount);
            List<InquireDetails> inqList = inquireService.selectInquireByCityNo(inquireDetails, pInfo);

            Map<String, Object> response = new HashMap<>();
            response.put("pageInfo", pInfo);
            response.put("inqList", inqList);

            return ResponseEntity.ok(response);
        } else {
            return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
        }

    }

    //문의 검색
    @PostMapping("/inquireSearch.do")
    public ResponseEntity<Map<String, Object>> searchInquireList(@RequestParam("searchCondition") String searchCondition
            , @RequestParam("searchKeyword") String searchKeyword
            , @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
            , HttpSession session){
        int checkAdmin = (int) session.getAttribute("sessionUserGrade");
        Map<String, Object> response = new HashMap<>();
        if (checkAdmin >= 2) {
            Map<String, String> paramMap = new HashMap<>();
            paramMap.put("searchCondition", searchCondition);
            paramMap.put("searchKeyword", searchKeyword);
            int totalCount = inquireService.searchInqListCount(paramMap);
            PageInfo pInfo = adminController.getPageInfo(currentPage, totalCount);
            List<InquireDetails> inqList = inquireService.searchInquireByKeyword(pInfo, paramMap);

            response.put("searchCondition", searchCondition);
            response.put("searchKeyword", searchKeyword);
            response.put("pInfo", pInfo);
            response.put("inqList", inqList);
            return ResponseEntity.ok(response);
        } else {
            response.put("error", "권한이 없습니다.");
            return ResponseEntity.status(HttpStatus.FORBIDDEN).body(response);
        }
    }

    //신고글 조회
    @GetMapping("/reportListDetail.do")
    public ResponseEntity<List<ReportDetails>> getReportDetails(@RequestParam("divNo") int divNo) {
        List<ReportDetails> reportDetailsList = reportService.getReportDetailsByDivNo(divNo);
        Map<String, String> categoryMap = new HashMap<>();
        categoryMap.put("fraud", "사기 글이에요");
        categoryMap.put("unpleasant", "회원들에게 불쾌감을 주는 글이에요");
        categoryMap.put("inappropriate", "부적절한 회원이에요");
        categoryMap.put("other", "기타 다른 사유가 있어요");

        for (ReportDetails report : reportDetailsList) {
            String category = report.getRepCategory();
            String categoryDescription = categoryMap.get(category);
            report.setRepCategory(categoryDescription);
        }
        return ResponseEntity.ok(reportDetailsList);
    }

    //예약 검색
    @PostMapping("/reservationSearch.do")
    public ResponseEntity<Map<String, Object>> searchReservationList(@RequestParam("searchCondition") String searchCondition
            , @RequestParam("searchKeyword") String searchKeyword
            , @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
            , HttpSession session){
        int checkAdmin = (int) session.getAttribute("sessionUserGrade");
        Map<String, Object> response = new HashMap<>();
        if (checkAdmin >= 2) {
            Map<String, String> paramMap = new HashMap<>();
            paramMap.put("searchCondition", searchCondition);
            paramMap.put("searchKeyword", searchKeyword);
            int totalCount = adminService.searchResListCount(paramMap);
            PageInfo pInfo = adminController.getPageInfo(currentPage, totalCount);
            List<ReservationAdmin> reservationList = adminService.searchResByKeyword(pInfo, paramMap);
            response.put("searchCondition", searchCondition);
            response.put("searchKeyword", searchKeyword);
            response.put("pInfo", pInfo);
            response.put("reservationList", reservationList);
            return ResponseEntity.ok(response);
        } else {
            response.put("error", "권한이 없습니다.");
            return ResponseEntity.status(HttpStatus.FORBIDDEN).body(response);
        }
    }

    //관할 지역 예약 검색
    @PostMapping("/resLocalSearch.do")
    public ResponseEntity<Map<String, Object>> searchReservationListByLocal(@RequestParam("searchCondition") String searchCondition
            , @RequestParam("searchKeyword") String searchKeyword
            , @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
            , @RequestParam("regionNo") Integer regionNo
            , HttpSession session){
        int checkAdmin = (int) session.getAttribute("sessionUserGrade");
        Map<String, Object> response = new HashMap<>();
        if (checkAdmin >= 2) {
            Map<String, String> paramMap = new HashMap<>();
            paramMap.put("searchCondition", searchCondition);
            paramMap.put("searchKeyword", searchKeyword);
            paramMap.put("regionNo", String.valueOf(regionNo));

            int totalCount = adminService.searchResLocalListCount(paramMap);
            PageInfo pInfo = adminController.getPageInfo(currentPage, totalCount);
            List<ReservationAdmin> reservationList = adminService.searchResLocalByKeyword(pInfo, paramMap);
            response.put("searchCondition", searchCondition);
            response.put("searchKeyword", searchKeyword);
            response.put("regionNo", regionNo);
            response.put("pInfo", pInfo);
            response.put("reservationList", reservationList);
            return ResponseEntity.ok(response);
        } else {
            response.put("error", "권한이 없습니다.");
            return ResponseEntity.status(HttpStatus.FORBIDDEN).body(response);
        }
    }
}
