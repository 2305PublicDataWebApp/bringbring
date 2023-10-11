package com.bringbring.reservation.controller;

import com.bringbring.reservation.domain.WasteData;
import com.bringbring.reservation.service.ReservationService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/reservation")
public class RestReservationController {

    private final ReservationService reservationService;

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

}
