package com.bringbring.reservation.controller;

import com.bringbring.reservation.domain.*;
import com.bringbring.reservation.service.PayService;
import com.bringbring.reservation.service.ReservationService;
import com.bringbring.user.domain.User;
import com.bringbring.user.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.net.ProtocolException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/reservation")
public class RestReservationController {

    private final ReservationService reservationService;
    private final UserService userService;
    private final PayService payService;

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

    @PostMapping("/imageUpload.do")
    @ResponseBody
    public String handleFileUpload(@RequestParam("file") MultipartFile[] uploadFiles
            , @RequestParam("wasteInfoNo") String[] wasteInfoNo
            , @RequestParam("imageIndexNo") String[] imageIndexNo
            , HttpServletRequest request
            , HttpSession session, Model model) {
        Map<String, Object> result = reservationService.addImages(wasteInfoNo, imageIndexNo, uploadFiles, request);
        if(result != null) {
            session.setAttribute("imageAdd", result);
            return "success";
        } else {
            model.addAttribute("msg", "사진 업로드에 실패했습니다")
                    .addAttribute("url", "/reservation/addImage.do");
            return "/common/error";
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

            session.setAttribute("payId", payId);

        if (result >= 4) {
            return new ResponseEntity<>("Success", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Failure", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/cancel.do")
    public ResponseEntity<Pay> cancelRequest(@RequestBody Map<String, String> request) throws ProtocolException {
//        String payId = pay.getPayId();
        CancelRequest cancelRequest = reservationService.selectPayIdByDischargeNo(request.get("dischargeNo"));
        String payId = cancelRequest.getPay().getPayId();
        String cancel_request_amount = request.get("cancel_request_amount");
        int reasonNo = Integer.parseInt(request.get("reason"));
        Pay payResult = reservationService.selectPayInfoByPayId(payId);
        String token = payService.getToken();
        payService.cancelRequest(request, token);
        System.out.println("payResult = " + payResult);
        boolean cancelSuccess = payService.cancelRequest(request, token);
        boolean dbUpdate = false;
        if(cancelSuccess) {
            dbUpdate = payService.cancelPayInfo(payId, reasonNo);
        }

        if (cancelSuccess && dbUpdate) {
            System.out.println("취소 성공");
            return ResponseEntity.ok(payResult);
        } else {
            // 취소 요청이 실패한 경우 400 Bad Request 또는 다른 적절한 상태 코드 반환
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }
    }

    @GetMapping("/selectMyList.do")
    public ResponseEntity<List<ReservationComplete>> selectMyReservationDetailList(@RequestParam int rvNo) {
        List<ReservationComplete> reservationCompletes = reservationService.selectMyReservationDetailList(rvNo);
        if (reservationCompletes != null) {
            return ResponseEntity.ok(reservationCompletes);
        } else {
            // 데이터가 없는 경우 404 Not Found 상태 코드 반환
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping("/selectImage.do")
    public ResponseEntity<List<ReservationComplete>> selectImages(@RequestParam int rvDetailNo
            , @RequestParam int imageIndexNo) {
        Connection connection = new Connection();
        connection.setImageIndexNo(imageIndexNo);
        connection.setRvDetailNo(rvDetailNo);


        List<ReservationComplete> reservationCompletes = reservationService.selectMyReservationDetailImage(connection);
        if (reservationCompletes != null) {
            return ResponseEntity.ok(reservationCompletes);
        } else {
            // 데이터가 없는 경우 404 Not Found 상태 코드 반환
            return ResponseEntity.notFound().build();
        }
    }



}
