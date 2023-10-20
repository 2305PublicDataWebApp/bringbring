package com.bringbring.reservation.controller;

import com.bringbring.reservation.domain.*;
import com.bringbring.reservation.service.ReservationService;
import com.bringbring.user.domain.User;
import com.bringbring.user.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/reservation")
public class RestReservationController {

    private final ReservationService reservationService;
    private final UserService userService;

    @GetMapping("/selectItem.do")
    public ResponseEntity<List<WasteData>> selectWasteList(@RequestParam String selectItem) {
        List<WasteData> wasteList = reservationService.selectWasteList(selectItem);

        // 반환할 데이터가 있는 경우 ResponseEntity로 JSON 형식으로 반환
        if (!wasteList.isEmpty()) {
            System.out.println("wasteList = " + wasteList);
            return ResponseEntity.ok(wasteList);
        } else {
            // 데이터가 없는 경우 404 Not Found 상태 코드 반환
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping("/select/userInfo.do")
    public ResponseEntity<User> selectUserInfo(@RequestParam String userId) {
        User user = userService.selectOneById(userId);
        // 반환할 데이터가 있는 경우 ResponseEntity로 JSON 형식으로 반환
        if (user != null) {
            return ResponseEntity.ok(user);
        } else {
            // 데이터가 없는 경우 404 Not Found 상태 코드 반환
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping("/pay.do")
    public ResponseEntity<String> feePay(@ModelAttribute ReservationDetail reservationDetail
            , @ModelAttribute Pay pay, HttpSession session) throws Exception{
        session.setAttribute("payInfo", pay);
        List<Integer> selectedItems = (List<Integer>) session.getAttribute("selectedItems");
        Map<String, Object> imageAdd = (Map<String, Object>) session.getAttribute("imageAdd");
        Reservation reservationUserInfo = (Reservation) session.getAttribute("reservationUserInfo");

//        Integer result = 0;
//
//        try {

            List<Object> insertInfo = new ArrayList<>();
            insertInfo.add(selectedItems);
            insertInfo.add(imageAdd);
            insertInfo.add(reservationUserInfo);
            insertInfo.add(reservationDetail);
            insertInfo.add(pay);

        Integer result = reservationService.insertReservation(selectedItems, imageAdd, reservationUserInfo, reservationDetail, pay);
        System.out.println("result = " + result);

            String payId = pay.getPayId();

            List<ReservationComplete> reservationComplete = reservationService.selectReservationCompleteInfo(payId);


            session.setAttribute("reservationComplete", reservationComplete);
//        } catch (Exception e) {
//            e.printStackTrace();
//            System.out.println("e.getMessage() = " + e.getMessage());
//        }


        if (result >= 4) {
            return new ResponseEntity<>("Success", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Failure", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }


}
