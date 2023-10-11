package com.bringbring.reservation.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/reservation")
public class ReservationController {

//    private final
// 페이지 이동
    @GetMapping("/select.do")
    public String showWasteSelect() {
        return "/reservation/wasteSelect";
    }
    @GetMapping("/addImage.do")
    public String showImageAdd() {
        return "/reservation/imageAdd";
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







}
