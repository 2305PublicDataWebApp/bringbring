package com.bringbring.reservation.controller;

import com.bringbring.reservation.domain.WasteData;
import com.bringbring.reservation.domain.WasteInfo;
import com.bringbring.reservation.service.ReservationService;
import com.bringbring.user.domain.User;
import com.bringbring.user.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/reservation")
public class ReservationController {

    private final ReservationService reservationService;
    private final UserService userService;
    // 페이지 이동
    @GetMapping("/select.do")
    public String showWasteSelect() {
        return "/reservation/wasteSelect";
    }
    @GetMapping("/addImage.do")
    public ModelAndView showImageAdd(HttpSession session, ModelAndView mv) {
        List<Integer> selectedItems = (List<Integer>) session.getAttribute("selectedItems");
        if(selectedItems != null) {
            List<WasteData> wasteDataList = new ArrayList<>();
            for (Integer wasteInfoNo : selectedItems) {
                System.out.println("wasteInfoNo = " + wasteInfoNo);
                WasteData wasteData = reservationService.selectInfoNoData(wasteInfoNo);
                wasteDataList.add(wasteData);
                }
            mv.addObject("wasteDataList", wasteDataList)
                .setViewName("reservation/imageAdd");
        } else {
            mv.addObject("msg", "선택된 폐기물이 없습니다")
                .addObject("url", "/reservation/select.do")
                    .setViewName("/common/error");
        }
        return mv;
    }
    @GetMapping("/insertInfo.do")
    public String showInsertInfo(HttpSession httpSession, Model model) {
        String userId = (String) httpSession.getAttribute("sessionId");
        if (userId != null && !userId.isEmpty()) {
            User user = userService.selectOneById(userId);
            model.addAttribute("userInfo", user);
        }
        return "/reservation/insertInfo";
    }
    @GetMapping("/payment.do")
    public String showPayment() {
        return "/reservation/payment";
    }
    @GetMapping("/payComplete.do")
    public String showPayComplete() {
        return "/reservation/payComplete";
    }

    @PostMapping("/select/insert.do")
    public String insertSelectedItems(@RequestParam("wasteInfoNoList") List<Integer> wasteInfoNoList, HttpSession session) {
        session.setAttribute("selectedItems", wasteInfoNoList);
        return "redirect:/reservation/addImage.do";
    }



    @PostMapping("/addImage.do")
    public ModelAndView insertImage(ModelAndView mv
            , WasteInfo wasteInfo
            , @RequestParam (value="uploadFiles", required = false) MultipartFile[] uploadFiles
            , HttpServletRequest request
            , HttpSession httpSession) {

        for (MultipartFile file : uploadFiles) {
            System.out.println("File Name: " + file.getOriginalFilename());
            System.out.println("File Size: " + file.getSize());
            // 기타 파일 정보 로깅
        }
        Map<String, Object> result = reservationService.insertImages(wasteInfo, uploadFiles, request);


        // 이미지와 wasteInfoNo를 Map에 저장한 결과를 확인
        for (Map.Entry<String, Object> entry : result.entrySet()) {
            String key = entry.getKey();
            Object value = entry.getValue();

            // 만약 값(value)이 Map인 경우, 다시 반복하여 출력
            if (value instanceof Map) {
                System.out.println(key + " is a Map:");
                Map<String, String> innerMap = (Map<String, String>) value;
                for (Map.Entry<String, String> innerEntry : innerMap.entrySet()) {
                    String innerKey = innerEntry.getKey();
                    String innerValue = innerEntry.getValue();
                    System.out.println(innerKey + " = " + innerValue);
                }
            } else {
                System.out.println(key + " = " + value);
            }
        }

            mv.setViewName("/reservation/insertInfo");
            return mv;
        }

    }
