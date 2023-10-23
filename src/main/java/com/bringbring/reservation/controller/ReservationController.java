package com.bringbring.reservation.controller;

import com.bringbring.common.PageInfo;
import com.bringbring.region.domain.City;
import com.bringbring.region.service.RegionService;
import com.bringbring.reservation.domain.*;
import com.bringbring.reservation.service.ReservationService;
import com.bringbring.user.domain.User;
import com.bringbring.user.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
    private final RegionService regionService;
    // 페이지 이동
    @GetMapping("/select.do")
    public String showWasteSelect(HttpSession session, Model model) {
        String userId = (String)session.getAttribute("sessionId");
        if(userId != null) {
            return "/reservation/wasteSelect";
        } else {
            model.addAttribute("msg", "로그인 후 이용할 수 있습니다.")
                    .addAttribute("url", "/user/login.do");
            return "/common/error";
        }
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
    public String showInsertInfo(HttpSession session, Model model) {
        String userId = (String) session.getAttribute("sessionId");
        Map<String, Object> imageList = (Map<String, Object>) session.getAttribute("imageAdd");
        List<City> cityList = regionService.selectCityList();
        if (imageList == null || imageList.isEmpty()) {
            model.addAttribute("msg", "업로드한 이미지 정보가 없습니다.")
                    .addAttribute("url", "/reservation/addImage.do");
            return "/common/error";
        }
        if (userId != null && !userId.isEmpty()) {
            User user = userService.selectOneById(userId);
            model.addAttribute("userInfo", user)
                    .addAttribute("cList", cityList);
        }
        return "/reservation/insertInfo";
    }

    @PostMapping("/insertInfo.do")
    public String insertInfo(HttpSession session, @Valid @ModelAttribute Reservation reservation) {
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
            return "/reservation/payment";
        } else  {
            model.addAttribute("msg", "배출 정보가 없습니다.")
                    .addAttribute("url", "/reservation/insertInfo.do");
            return "/common/error";
        }
    }


    @GetMapping("/payComplete.do")
    public String payComplete(HttpSession session, Model model) {
        String payId = (String) session.getAttribute("payId");
        List<Integer> selectedItems = (List<Integer>) session.getAttribute("selectedItems");
            List<WasteData> wasteDataList = new ArrayList<>();
        if (!selectedItems.isEmpty()){
            for (Integer wasteInfoNo : selectedItems) {
                // 리스트에 대형폐기물 정보 저장
                WasteData wasteData = reservationService.selectInfoNoData(wasteInfoNo);
                // no로 총 배출품목 갯수
                wasteDataList.add(wasteData);
            }
        }
        if (payId == null || payId.isEmpty()) {
            model.addAttribute("msg", "결제 내역을 찾을 수 없습니다.")
                    .addAttribute("url", "/reservation/payment.do");
            return "/common/error";
        }
        List<WasteData> wasteData = reservationService.selectpayCompleteWasteDate(payId);
        model.addAttribute("wasteData", wasteData).addAttribute("wasteDataList", wasteDataList);
        System.out.println("wasteDataList = " + wasteDataList.get(0).getWasteCategory().getWasteCategoryName());
        System.out.println("wasteDataList size: " + wasteDataList.size());


        return "/reservation/payComplete";
    }


    @GetMapping("/list.do")
    public String showReservationList(HttpSession session, Model model
            , @RequestParam(value="page", required = false, defaultValue = "1") Integer currentPage) {
        String userId = (String)session.getAttribute("sessionId");
        System.out.println("userId = " + userId);
        User user = reservationService.selectUserNo(userId);
        int userNo = user.getUserNo();
        int totalCount = reservationService.selectReservationListCount(userNo);
        PageInfo pageInfo = reservationService.getPageInfo(currentPage, userNo, totalCount);
        if(userId != null) {
            List<ReservationComplete> reservationList = reservationService.selectReservationList(pageInfo, userNo);
            model.addAttribute("reservationList", reservationList).addAttribute("pageInfo", pageInfo);
            return "/reservation/list";
        } else {
            model.addAttribute("msg", "로그인 정보를 찾을 수 없습니다.")
                    .addAttribute("url", "/user/login.do");
            return "/common/error";
        }
    }

    @GetMapping("/guide.do")
    public String showReservationGuide(Model model) {
//        List<WasteData> wasteList = reservationService.AllWasteList();
//        model.addAttribute("wasteList", wasteList);
        return "/reservation/guide";
    }

//    @GetMapping("/modifyInfo.do")
//    public String modifyInfo(HttpSession session, Model model) {
//
//        return "/reservation/modifyInfo";
//    }

//    @PostMapping("/addImage.do")
//    public String addImages(ModelAndView mv
//            , @RequestParam(value="wasteInfoNo", required = false) String[] wasteInfoNo
//            , @ModelAttribute MultipartFile[] uploadFiles
//            , HttpServletRequest request
//            , HttpSession session
//            , Model model) {
//
//        Map<String, Object> result = reservationService.addImages(wasteInfoNo , uploadFiles, request);
//        if(result != null) {
//            session.setAttribute("imageAdd", result);
//        } else {
//            model.addAttribute("msg", "사진 업로드에 실패했습니다")
//                    .addAttribute("url", "/reservation/addImage.do");
//            return "/common/error";
//        }
//        return "redirect:/reservation/insertInfo.do";
//    }

}