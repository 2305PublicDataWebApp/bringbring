package com.bringbring.reservation.controller;

import com.bringbring.reservation.domain.WasteData;
import com.bringbring.reservation.service.ReservationService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/reservation")
public class ReservationController {

    private final ReservationService reservationService;
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
    public String showInsertInfo() {
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

}
