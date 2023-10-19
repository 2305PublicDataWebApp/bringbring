package com.bringbring.reservation.controller;

import com.bringbring.reservation.domain.Reservation;
import com.bringbring.reservation.domain.ReservationDetail;
import com.bringbring.reservation.domain.WasteData;
import com.bringbring.reservation.service.ReservationService;
import com.bringbring.user.domain.User;
import com.bringbring.user.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
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

    @PostMapping("/select/insert.do")
    public String insertSelectedItems(@RequestParam("wasteInfoNoList") List<Integer> wasteInfoNoList, HttpSession session) {
        session.setAttribute("selectedItems", wasteInfoNoList);
        return "redirect:/reservation/addImage.do";
    }

    @GetMapping("/addImage.do")
    public String showImageAdd(HttpSession session, Model model) {
        List<Integer> selectedItems = (List<Integer>) session.getAttribute("selectedItems");
        if(selectedItems != null) {
            List<WasteData> wasteDataList = new ArrayList<>();
            for (Integer wasteInfoNo : selectedItems) {
                System.out.println("wasteInfoNo = " + wasteInfoNo);
                WasteData wasteData = reservationService.selectInfoNoData(wasteInfoNo);
                wasteDataList.add(wasteData);
                }
            model.addAttribute("wasteDataList", wasteDataList);
            return  "reservation/imageAdd";
        } else {
            model.addAttribute("msg", "선택된 폐기물이 없습니다")
                    .addAttribute("url", "/reservation/select.do");
            return "/common/error";
        }
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

    @PostMapping("/insertInfo.do")
    public String insertInfo(HttpSession session, @Valid @ModelAttribute("reservation") Reservation reservation) {
        session.setAttribute("reservationUserInfo", reservation);
        return "redirect:/reservation/payment.do";
    }

    @GetMapping("/payment.do")
    public String showPayment(HttpSession session, Model model) {
        List<Integer> selectedItems = (List<Integer>) session.getAttribute("selectedItems");
        Reservation reservation = (Reservation) session.getAttribute("reservationUserInfo");
        if (selectedItems != null && reservation != null) {
            List<WasteData> wasteDataList = new ArrayList<>();
            int totalFee = 0;
            for (Integer wasteInfoNo : selectedItems) {
                // 리스트에 대형폐기물 정보 저장
                WasteData wasteData = reservationService.selectInfoNoData(wasteInfoNo);
                int fee = wasteData.getWasteInfo().getWasteInfoFee();
                // 수수료 누적 계산
                totalFee += fee;
                // no로 총 배출품목 갯수
                wasteDataList.add(wasteData);
            }
            int totalCount = selectedItems.size();
            ReservationDetail reservationDetail = new ReservationDetail();
            reservationDetail.setRvDetailTotal(totalCount);
            reservationDetail.setRvDetailFee(totalFee);
            System.out.println("reservationDetail = " + reservationDetail);
            model.addAttribute("wasteDataList", wasteDataList)
                    .addAttribute("reservationInfo", reservation)
                    .addAttribute("reservationDetail", reservationDetail);
        }
            return "/reservation/payment";
        }


    @GetMapping("/payComplete.do")
    public String payComplete(HttpSession session, Model model) {

        return "/reservation/payComplete";
    }



    @PostMapping("/addImage.do")
    public ModelAndView insertImage(ModelAndView mv
            , @RequestParam(value="wasteInfoNo", required = false) String[] wasteInfoNo
            , @RequestParam (value="uploadFiles", required = false) MultipartFile[] uploadFiles
            , HttpServletRequest request
            , HttpSession httpSession) {

        for (MultipartFile file : uploadFiles) {
            System.out.println("File Name: " + file.getOriginalFilename());
            System.out.println("File Size: " + file.getSize());
            // 기타 파일 정보 로깅
        }
        Map<String, Object> result = reservationService.insertImages(wasteInfoNo , uploadFiles, request);


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
