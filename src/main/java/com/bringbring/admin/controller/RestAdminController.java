package com.bringbring.admin.controller;

import com.bringbring.common.PageInfo;
import com.bringbring.inquire.domain.InquireDetails;
import com.bringbring.inquire.service.InquireService;
import com.bringbring.report.domain.ReportDetails;
import com.bringbring.report.service.ReportService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

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

    private static final String API_KEY = "uy3jYbeNo9pdYLz%2FbZXRO%2F3tFw9FcY6FjN1mlzXiPnfDm4yy4z4ceuYU2ValrUULBJVlrX6JBznSjobmLH1A7w%3D%3D";
    private static final String API_URL = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";
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

    @GetMapping("/weather.do")
    public String getWeather(){
        // API 응답을 그대로 클라이언트로 반환
        return API_URL + "?ServiceKey=" + API_KEY;
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

}
