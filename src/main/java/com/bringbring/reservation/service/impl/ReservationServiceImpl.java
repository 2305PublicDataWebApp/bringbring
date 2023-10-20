package com.bringbring.reservation.service.impl;

import com.bringbring.image.domain.Image;
import com.bringbring.reservation.domain.*;
import com.bringbring.reservation.service.ReservationService;
import com.bringbring.reservation.store.ReservationStore;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

@RequiredArgsConstructor
@Transactional
@Service
public class ReservationServiceImpl implements ReservationService {

    private final ReservationStore reservationStore;

    @Override
    @Transactional(readOnly = true)
    public List<WasteData> selectWasteList(String selectItem) {
        return this.reservationStore.selectWasteList(selectItem);
    }

    @Override
    @Transactional(readOnly = true)
    public List<WasteCategory> selectWasteCategoryList() {
        return reservationStore.selectWasteCategoryList();
    }

    @Override
    public WasteData selectInfoNoData(Integer wasteInfoNo) {
        return reservationStore.selectInfoNoData(wasteInfoNo);
    }



    @Transactional
    @Override
    public Integer insertReservation(List<Integer> selectedItems, Map<String, Object> imageAdd, Reservation reservationUserInfo, ReservationDetail reservationDetail, Pay pay) {
        System.out.println("selectedItems = " + selectedItems);
        System.out.println("imageAdd = " + imageAdd);
        System.out.println("reservationUserInfo = " + reservationUserInfo);
        System.out.println("reservationDetail = " + reservationDetail);
        System.out.println("pay = " + pay);

        int rvDetailNo = 0;
        int reservationResult = 0;
        int reservationDetailResult = 0;
        int payResult = 0;
        int imageResult = 0;
        int insertTotal = 0;

        // 이미지 총 개수
        int imageTotal = imageAdd.size();
        System.out.println("imageTotal = " + imageTotal);

//
//
        try {

            if (reservationUserInfo != null) {
                reservationResult = reservationStore.insertResertvation(reservationUserInfo);
                System.out.println("reservationResult = " + reservationResult);
            }
            // 성공

            if (reservationDetail != null  && reservationResult > 0) {
                reservationDetailResult = reservationStore.insertReservationDetail(reservationDetail);
                rvDetailNo = reservationDetail.getRvDeatilNo();
                System.out.println("rvDetailNo = " + rvDetailNo);
                System.out.println("reservationDetailResult = " + reservationDetailResult);
            }

            if (!imageAdd.isEmpty() && reservationDetailResult > 0) {
                imageResult = this.insertImages(imageAdd, rvDetailNo);
                System.out.println("imageResult = " + imageResult);
            } else {
                System.out.println("[오류] = 왜 오류가 날까 / imageAdd.isEmpty?" + imageAdd.isEmpty() + "[imageResult] = " + imageResult);
            }

            pay.setRvDetailNo(rvDetailNo);
            payResult = reservationStore.insertPay(pay);
            System.out.println("payResult = " + payResult);

            insertTotal = reservationResult + reservationDetailResult + payResult + imageResult;
            System.out.println("insertTotal = " + insertTotal);
            System.out.println("비교Total = " + (3 + imageResult));
            if (insertTotal != (3 + imageResult)) {
                throw new RuntimeException("결제가 제대로 처리되지 않습니다.");
            }
//
        }catch (Exception ex) {
        System.err.println("예외 발생: " + ex.getMessage());
        ex.printStackTrace();
    }

        System.out.println("insertTotal = " + insertTotal);
        return insertTotal;
    }

    @Override
    public ReservationComplete selectReservationCompleteInfo(String payId) {
        return reservationStore.selectReservationCompleteInfo(payId);
    }















    // ***************** 이미지 관련 *****************
    // 세션에 저장용, 실제 저장은 x
    @Override
    public Map<String, Object> addImages(String[] wasteInfoNo, MultipartFile[] uploadFiles, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();
        // 파일 업로드 및 저장
        List<Map<String, String>> saveImgs = uploadImages(wasteInfoNo, uploadFiles, request);
        // 이미지 정보 저장
        result.put("imagePaths", saveImgs);
        return result;
    }

    // 파일 리네임 밒 경로 생성 메소드
    public List<Map<String, String>> uploadImages(String[] wasteInfoNo, MultipartFile[] uploadFiles, HttpServletRequest request) {
        List<Map<String, String>> imagePaths = new ArrayList<>();

        for (int i = 0; i < uploadFiles.length; i++) {
            MultipartFile files = uploadFiles[i];
            String currentWasteInfoNo = wasteInfoNo[i]; // 해당 이미지의 wasteInfoNo

            if (!files.isEmpty()) {
                try {
                    // 업로드 저장 경로 생성
                    String root = request.getSession().getServletContext().getRealPath("resources");
                    String saveFolder = root + "\\assets\\img\\rUploadFiles";
                    File folder = new File(saveFolder);
                    if (!folder.exists()) {
                        folder.mkdir();
                    }

                    // 파일 이름, 경로 생성
                    String imageName = files.getOriginalFilename(); // 실제 파일명
                    String ext = imageName.substring(imageName.lastIndexOf(".") + 1); // 확장자 추출
                    String imageRename = UUID.randomUUID().toString() + "." + ext; // 파일 리네임 - UUID 객체로 랜덤 생성
                    String savePath = saveFolder + "\\" + imageRename; // 파일 경로

                    //파일 객체 생성 후 실제파일저장
                    File file = new File(savePath);
                    files.transferTo(file);
                    String dbPath = "../resources/assets/img/rUploadFiles/" + imageRename;

                    // 이미지 정보를 별도의 맵에 저장
                    Map<String, String> imageInfo = new HashMap<>();
                    imageInfo.put("imageName", imageName);
                    imageInfo.put("imageRename", imageRename);
                    imageInfo.put("savePath", savePath);
                    imageInfo.put("wasteInfoNo", currentWasteInfoNo); // wasteInfoNo를 맵에 추가
                    imagePaths.add(imageInfo);

                    System.out.println("Image Info: " + imageInfo);

                } catch (IllegalStateException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
            }
        }

        return imagePaths;
    }
    // 실제로 db에 저장
    private int insertImages(Map<String, Object> imageAdd, int rvDeatilNo) {
        int result = 0; // 이미지 삽입 횟수를 초기화

        for (Map.Entry<String, Object> entry : imageAdd.entrySet()) {
            String key = entry.getKey();
            Object value = entry.getValue();

            if (value instanceof List) {
                List<Object> valueList = (List<Object>) value;
                for (int i = 0; i < valueList.size(); i++) {
                    HashMap<String, Object> innerMap = (HashMap<String, Object>) valueList.get(i);

                    try {


                        // 여기에서 innerMap을 사용하여 필드 값을 추출하고 처리
                        String imageName = (String) innerMap.get("imageName");
                        String imageRename = (String) innerMap.get("imageRename");
                        String savePath = (String) innerMap.get("savePath");
                        String wasteInfoNoStr =  (String) innerMap.get("wasteInfoNo");
                        int wasteInfoNo = Integer.parseInt(wasteInfoNoStr);

                        // 이미지 객체 생성
                        Image image = new Image("reservation", rvDeatilNo, imageName, imageRename, savePath);
                        System.out.println("image = " + image);
                        // 이미지 객체를 데이터베이스에 삽입
                        int insertResult = reservationStore.insertReservationImage(image);

                        if (insertResult > 0) {
                            // 이미지 객체가 성공적으로 데이터베이스에 삽입됨

                            // 이미지 객체에 이미지 번호를 가져옵니다.
                            int imageNo = image.getImageNo();

                            // 가져온 이미지 번호와 imageAdd가 가지고 있는 정보로 연결 테이블에 삽입합니다.
                            Connection connection = new Connection();
                            connection.setRvDetailNo(rvDeatilNo);
                            connection.setWasteInfoNo(wasteInfoNo);
                            connection.setImageNo(imageNo);

                            int insertConnection = reservationStore.insertConnection(connection);

                            if (insertConnection > 0) {
                                result++; // 이미지 삽입이 성공한 경우에만 결과를 증가시킵니다.
                            }
                        } else {
                            // 이미지 객체 삽입에 실패한 경우의 처리
                            System.out.println("필수 필드가 누락되었거나 데이터 형식이 맞지 않습니다.");
                        }




                    }catch (Exception ex) {
                        System.err.println("예외 발생: " + ex.getMessage());
                        ex.printStackTrace();
                    }
                }


            }
            }
        return result;
    }
















//    private void insertImages(Map<String, Object> imageAdd, int rvDeatilNo) {
//        int result = 0; // 이미지 삽입 횟수를 초기화
//
//        for (Map.Entry<String, Object> entry : imageAdd.entrySet()) {
//            String key = entry.getKey();
//            Object value = entry.getValue();
//        // 이미지 정보 목록을 순환합니다.
//            if (key.equals("imageName") && value instanceof String) {
//            String imageName = (String) imageAdd.get("imageName");
//            String imageRename = (String) imageAdd.get("imageRename");
//            String savePath = (String) imageAdd.get("savePath");
//            int wasteInfoNo = (int) imageAdd.get("wasteInfoNo");
//
//            // 이미지 객체 생성
//            Image image = new Image("reservation", rvDeatilNo, imageName, imageRename, savePath);
//
//            int insertResult = reservationStore.insertReservationImage(image);
//
//            // 이미지 테이블에 삽입한 내용 중 리네임으로 이미지 번호를 가져옵니다.
////            reservationStore.selectReservationImage(imageRename);
//            int imageNo = image.getImageNo();
//
//                // 가져온 이미지 번호와 imageAdd가 가지고 있는 정보로 연결 테이블에 삽입합니다.
//            Connection connection = new Connection();
//            connection.setRvDetailNo(rvDeatilNo);
//            connection.setWasteInfoNo(wasteInfoNo);
//            connection.setImageNo(imageNo);
//
//            int insertConnection = reservationStore.insertConnection(connection);
//
//            if (insertConnection > 0) {
//                result++; // 이미지 삽입이 성공한 경우에만 결과를 증가시킵니다.
//            }
////        }
//
//    }














//    @Override
//    public Integer insertReservation(List<Object> insertInfo) {
//        System.out.println("insertInfo = " + insertInfo);
//        List<Integer> selectedItems = null;
//        List<Map<String, Object>> imageAdd = new ArrayList<>();
//        Reservation reservationUserInfo = (Reservation) insertInfo.get(2);
//        ReservationDetail reservationDetail = (ReservationDetail) insertInfo.get(3);
//        Pay pay = (Pay) insertInfo.get(4);
//
////        int rvDeatilNo = 0;
////        // result 값을 선언
////        int reservationResult = 0;
////        int reservationDetailResult = 0;
////        int payResult = 0;
////        int imageResult = 0;
//
//
//        // insertInfo에 있는 데이터 다시 새로운 list와 map에 저장하기
//        for (Object info : insertInfo) {
//            if (info instanceof List) {
//                selectedItems = (List<Integer>) info;
//            } else if (info instanceof Map) {
//                imageAdd = ( List<Map<String, Object>>) info;
//            }
//        }
//
//        int imageTotal = imageAdd.size();
//        System.out.println("imageTotal = " + imageTotal);
//
////        if (reservationUserInfo != null) {
//            // RESERVATION_TBL에 정보 저장하기
//            int reservationResult = reservationStore.insertResertvation(reservationUserInfo);
//            System.out.println("reservationResult = " + reservationResult);
////        }
////        if (reservationDetail != null) {
//            // RESERVATION_DETAIL_TBL에 정보 저장하기
//        int reservationDetailResult = reservationStore.insertReservationDetail(reservationDetail);
//        int rvDeatilNo = reservationStore.selectRvDetailMaxNo();
//            System.out.println("rvDeatilNo = " + rvDeatilNo);
//            System.out.println("reservationDetailResult = " + reservationDetailResult);
////        }
////        // 꺼내온 데이터를 다시 꺼내서 select
////        if (selectedItems != null) {
////
////        }
//
////        if (imageAdd != null) {
//            // 이미지 테이블과 연결 테이블에 insert
//        int imageResult = this.insertImages(imageAdd, rvDeatilNo);
//            System.out.println("imageResult = " + imageResult);
////        }
////        if (pay != null) {
//            pay.setRvDetailNo(rvDeatilNo);
//        int payResult = reservationStore.insertPay(pay);
//            System.out.println("payResult = " + payResult);
////        }
//        int insertTotal = reservationResult + reservationDetailResult + payResult + imageResult;
//        if (insertTotal > 3 + imageTotal && insertTotal < 3 + imageTotal) {
//            throw new RuntimeException("결제가 제대로 처리되지 않습니다.");
//        }
//        // 결과 값은 3 + 이미지 insert 횟수임
//        System.out.println("insertTotal = " + insertTotal);
//        return insertTotal;
//    }



//    String imageName = (String)imageMap.get("imageName");
//    String imageRename = (String)imageMap.get("imageRename");
//    String imagePath = (String)imageMap.get("imagePath");
//    Image image = new Image("divide" ,imageGroupNo, imageName, imageRename, imagePath);
//						divideStore.insertImage(image);













}
