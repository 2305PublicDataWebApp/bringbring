package com.bringbring.reservation.service.impl;

import com.bringbring.reservation.domain.Pay;
import com.bringbring.reservation.domain.PayCancel;
import com.bringbring.reservation.domain.Reservation;
import com.bringbring.reservation.domain.ReservationDetail;
import com.bringbring.reservation.service.PayService;
import com.bringbring.reservation.store.ReservationStore;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Map;

@Transactional
@Service
@RequiredArgsConstructor
public class PayServiceImpl implements PayService {

    private final ReservationStore reservationStore;
    private static final String API_HOST = "https://api.iamport.kr";
    private String impKey = "4716767823245622";
    private String impSecret = "6KURpsDnUZ2flO4uT8l3sUsYwudqUQGyDEB2oi1tLoFDbzx0R4s2bYJjjoqmMMEdlKjl7bBYlNdQXoMR";

    public String getToken() {
        String path = "/users/getToken";
        String url = API_HOST + path;

        String requestBody = String.format("{\"imp_key\":\"%s\", \"imp_secret\":\"%s\"}", impKey, impSecret);

        String accessToken = "";

        try {
            URL apiUrl = new URL(url);
            HttpURLConnection connection = (HttpURLConnection) apiUrl.openConnection();

            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
            connection.setRequestProperty("Accept", "*/*");
            connection.setDoOutput(true);

            try (OutputStream os = connection.getOutputStream()) {
                byte[] input = requestBody.getBytes(StandardCharsets.UTF_8);
                os.write(input, 0, input.length);
            }

            int responseCode = connection.getResponseCode();

            if (responseCode == HttpURLConnection.HTTP_OK) {
                // 응답을 읽기
                StringBuilder response = new StringBuilder();
                try (BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
                    String line;
                    while ((line = reader.readLine()) != null) {
                        response.append(line);
                    }
                }

                ObjectMapper objectMapper = new ObjectMapper();
                JsonNode jsonNode = objectMapper.readTree(response.toString());

                accessToken = jsonNode.path("response").path("access_token").asText();
                System.out.println("Access Token: " + accessToken);
            } else {
                System.out.println("액세스 토큰을 가져오는 데 실패했습니다. 응답 코드: " + responseCode);
            }

            connection.disconnect();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return accessToken;
    }

    @Override
    public boolean cancelRequest(Map<String, String> request, String token) {
        HttpURLConnection connection = null;
        try {
            String access_token = token; // 포트원 서버로부터 발급받은 엑세스 토큰
            String merchant_uid = request.get("merchant_uid"); // 주문번호
            String reason = request.get("reason"); // 환불사유
            String amountStr = request.get("cancel_request_amount");
            String amountWithoutWon = amountStr.replace("원", "");
            int cancel_request_amount = Integer.parseInt(amountWithoutWon); // 환불금액 (예: 100)

            // 조회한 결제 정보로부터 imp_uid, amount(결제금액), cancel_amount(환불된 총 금액) 추출
            String imp_uid = "imp44058332";
            int amount = cancel_request_amount; // 결제금액 (예: 1000)
            int cancel_amount = 0; // 환불된 총 금액 (예: 0)

            // 환불 가능 금액(= 결제금액 - 환불 된 총 금액) 계산
            int cancelableAmount = amount - cancel_amount;

            if (cancelableAmount <= 0) { // 이미 전액 환불된 경우
                System.out.println("이미 전액 환불된 주문입니다.");
                return false;
            }

            // 환불 요청 데이터 생성
            String requestBody = String.format("{\"reason\":\"%s\", \"imp_uid\":\"%s\", \"amount\":%d, \"checksum\":%d}", reason, imp_uid, cancel_request_amount, cancelableAmount);

            // 환불 요청
            try {
                String cancelUrl = "https://api.iamport.kr/payments/cancel";
                URL apiUrl = new URL(cancelUrl);
                connection = (HttpURLConnection) apiUrl.openConnection();

                connection.setRequestMethod("POST");
                connection.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
                connection.setRequestProperty("Authorization", access_token);
                connection.setDoOutput(true);

                try (OutputStream os = connection.getOutputStream()) {
                    byte[] input = requestBody.getBytes(StandardCharsets.UTF_8);
                    os.write(input, 0, input.length);
                }

                int responseCode = connection.getResponseCode();

                if (responseCode == HttpURLConnection.HTTP_OK) {
                    // 환불 결과를 읽기
                    StringBuilder response = new StringBuilder();
                    try (BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
                        String line;
                        while ((line = reader.readLine()) != null) {
                            response.append(line);
                        }
                    }

                    // 여기에서 환불 결과를 처리할 수 있습니다.
                    System.out.println("환불 결과: " + response.toString());
                    return true;
                } else {
                    System.out.println("환불 요청이 실패했습니다. 응답 코드: " + responseCode);
                    return false;
                }
            } catch (IOException e) {
                e.printStackTrace();
                return false;
            } finally {
                connection.disconnect();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    @Override
    public boolean cancelPayInfo(String payId, Integer reasonNo) {
        Pay pay = reservationStore.selectPayInfoByPayId(payId);
        ReservationDetail reservationDetail = reservationStore.selectReservationDetailByDetailNo(pay.getRvDetailNo());
        Reservation reservation = reservationStore.selectReservationNoByRvNo(reservationDetail.getRvNo());
        PayCancel payCancel = new PayCancel();
        payCancel.setPayNo(pay.getPayNo());
        payCancel.setCancelAmount(pay.getPayAmount());
        payCancel.setReasonNo(reasonNo);
        int totalResult = 0;
        int reservationResult = reservationStore.updateReservationIsCancel(reservation.getRvNo());
        int payUpdate = reservationStore.updatePayIsCancel(reservationDetail.getRvDetailNo());
        int payCancelInsert = reservationStore.insertPayCancel(payCancel);
        totalResult = reservationResult + payUpdate + payCancelInsert;
        System.out.println("payCancelInsert = " + totalResult);
        if(totalResult == 3){
            return true;
        } else {
            return false;
        }
    }


}
