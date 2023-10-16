package com.bringbring.reservation.controller;

import com.bringbring.reservation.domain.WasteData;
import com.bringbring.reservation.service.ReservationService;
import com.bringbring.user.domain.User;
import com.bringbring.user.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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

//    @PostMapping("/select/insert.do")
//    public ResponseEntity<List<Integer>> insertWasteSelect(@RequestBody List<Integer> wasteInfoNo, HttpSession session) {
//        if (!wasteInfoNo.isEmpty()) {
//            System.out.println("wasteList = " + wasteInfoNo.size());
//            session.setAttribute("wasteList", wasteInfoNo);
//            return ResponseEntity.ok(wasteInfoNo);
//        } else {
//            // 데이터가 없는 경우 404 Not Found 상태 코드 반환
//            return ResponseEntity.notFound().build();
//        }
//    }

//    @PostMapping("/select/insert.do")
//    public String insertSelectedItems(@RequestParam("wasteInfoNoList") List<Integer> wasteInfoNoList, HttpSession session) {
//        // wasteInfoNoList에 클라이언트에서 전송한 wasteInfoNo 값들이 List 형식으로 들어옵니다.
//        session.setAttribute("selectedItems", wasteInfoNoList);
//
//        // wasteInfoNoList를 순회하면서 필요한 로직을 수행
//        for (Integer wasteInfoNo : wasteInfoNoList) {
//            // 여기에서 필요한 로직을 수행
//            System.out.println("wasteInfoNo = " + wasteInfoNo);
//        }
//
//        return "redirect:/reservation/addImage.do";
//    }

//    @RequestMapping(value="/addImage.do", method=RequestMethod.POST)
//    public Map<String, Object> addImage(
//            @RequestParam(value = "wasteInfoNo") Map<String, Object> param,
//            @RequestPart(value = "uploadFiles", required = false) List<MultipartFile> fileList) throws Exception {
//
//
//        Map<String, Object> result = new HashMap<String, Object>();
//
//        // 서비스 메소드 호출 등 필요한 로직을 수행하십시오.
//        // bservice.insertBoard(param, fileList);
//
//        result.put("SUCCESS", false);
//
//        return result;
//    }


}
