package com.bringbring.reservation.service.impl;

import com.bringbring.common.PageInfo;
import com.bringbring.image.domain.Image;
import com.bringbring.reservation.domain.*;
import com.bringbring.reservation.service.ReservationService;
import com.bringbring.reservation.store.ReservationStore;
import com.bringbring.user.domain.User;
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

        int rvNo = 0;

        if (reservationUserInfo != null) {
                reservationResult = reservationStore.insertResertvation(reservationUserInfo);
                System.out.println("reservationResult = " + reservationResult);
            }

            if (reservationDetail != null  && reservationResult > 0) {
                rvNo = reservationUserInfo.getRvNo();
                reservationDetail.setRvNo(rvNo);
                reservationDetailResult = reservationStore.insertReservationDetail(reservationDetail);

//                rvDetailNo = reservationDetail.getRvDetailNo();
                reservationDetail.setRvDetailNo(rvNo);
//                System.out.println("rvDetailNo = " + rvDetailNo);
                System.out.println("reservationDetailResult = " + reservationDetailResult);
            }

            if (!imageAdd.isEmpty() && reservationDetailResult > 0) {
                imageResult = this.insertImages(imageAdd, rvNo);
                System.out.println("imageResult = " + imageResult);
            } else {
                System.out.println("[오류] = 왜 오류가 날까 / imageAdd.isEmpty?" + imageAdd.isEmpty() + "[imageResult] = " + imageResult);
            }

            pay.setRvDetailNo(rvNo);
            payResult = reservationStore.insertPay(pay);
            System.out.println("payResult = " + payResult);

            insertTotal = reservationResult + reservationDetailResult + payResult + imageResult;
            System.out.println("insertTotal = " + insertTotal);
            System.out.println("비교Total = " + (3 + imageResult));
            if (insertTotal != (3 + imageResult)) {
                throw new RuntimeException("결제가 제대로 처리되지 않습니다.");
            }
        System.out.println("insertTotal = " + insertTotal);
        return insertTotal;
    }

    @Override
    public List<ReservationComplete> selectReservationCompleteInfo(String payId) {

        return reservationStore.selectReservationCompleteInfo(payId);
    }

    @Override
    public List<WasteData> selectpayCompleteWasteDate(String payId) {
        return reservationStore.selectpayCompleteWasteDate(payId);
    }

    @Override
    public User selectUserNo(String userId) {
        return reservationStore.selectUserNo(userId);
    }

    @Override
    public int selectReservationListCount(int userNo) {
        return reservationStore.selectReservationListCount(userNo);
    }

    @Override
    public PageInfo getPageInfo(Integer currentPage, int userNo, int totalCount) {
        PageInfo pi = null;
        int recordCountPerPage = 3;
        int naviCountPerPage = 5;
        int naviTotalCount;
        int startNavi;
        int endNavi;

        naviTotalCount = (int)((double) totalCount / recordCountPerPage + 0.9);

        startNavi = (((int) ((double) currentPage / naviCountPerPage + 0.9)) - 1) * naviCountPerPage + 1;

        endNavi = startNavi + naviCountPerPage - 1;
        if (endNavi > naviTotalCount) {
            endNavi = naviTotalCount;
        }

        pi = new PageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage,
                startNavi, endNavi);
        return pi;
    }

    @Override
    public List<ReservationComplete> selectMyReservationList(PageInfo pageInfo, int userNo) {
        return reservationStore.selectMyReservationList(pageInfo, userNo);
    }

    @Override
    public List<ReservationComplete> selectMyReservationDetailImage(Connection connection) {
        return reservationStore.selectMyReservationDetailImage(connection);
    }

    @Override
    public List<ReservationComplete> selectMyReservationDetailList(int rvNo) {
        return reservationStore.selectMyReservationDetailList(rvNo);

    }

    @Override
    public List<ReservationComplete> selectInfoByDischargeNo(Reservation reservation) {
        return reservationStore.selectInfoByDischargeNo(reservation);
    }

    @Override
    public List<WasteData> AllWasteList() {
        return reservationStore.selectAllWasteList();
    }

    @Override
    public Pay selectPayInfoByPayId(String payId) {
        return reservationStore.selectPayInfoByPayId(payId);
    }

    @Override
    public CancelRequest selectPayIdByDischargeNo(String dischargeNo) {
        return reservationStore.selectPayIdByDischargeNo(dischargeNo);
    }


    // ***************** 이미지 관련 *****************
    // 세션에 저장용, 실제 저장은 x
    @Override
    public Map<String, Object> addImages(String[] wasteInfoNo, String[] imageIndexNo, MultipartFile[] uploadFiles, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();
        // 파일 업로드 및 저장
        List<Map<String, String>> saveImgs = uploadImages(wasteInfoNo, imageIndexNo, uploadFiles, request);
        // 이미지 정보 저장
        result.put("imagePaths", saveImgs);
        return result;
    }

    // 파일 리네임 밒 경로 생성 메소드
    public List<Map<String, String>> uploadImages(String[] wasteInfoNo, String[] imageIndexNo, MultipartFile[] uploadFiles, HttpServletRequest request) {
        List<Map<String, String>> imagePaths = new ArrayList<>();

        for (int i = 0; i < uploadFiles.length; i++) {
            MultipartFile files = uploadFiles[i];
            String currentWasteInfoNo = wasteInfoNo[i]; // 해당 이미지의 wasteInfoNo
            String currentImageIndexNo = imageIndexNo[i];

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
                    imageInfo.put("savePath", dbPath);
                    imageInfo.put("wasteInfoNo", currentWasteInfoNo); // wasteInfoNo를 맵에 추가
                    imageInfo.put("imageIndexNo", currentImageIndexNo); // wasteInfoNo를 맵에 추가
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
    private int insertImages(Map<String, Object> imageAdd, int rvNo) {
        int result = 0; // 이미지 삽입 횟수를 초기화

        for (Map.Entry<String, Object> entry : imageAdd.entrySet()) {
            String key = entry.getKey();
            Object value = entry.getValue();

            if (value instanceof List) {
                List<Object> valueList = (List<Object>) value;
                for (int i = 0; i < valueList.size(); i++) {
                    HashMap<String, Object> innerMap = (HashMap<String, Object>) valueList.get(i);

                        // 여기에서 innerMap을 사용하여 필드 값을 추출하고 처리
                        String imageName = (String) innerMap.get("imageName");
                        String imageRename = (String) innerMap.get("imageRename");
                        String savePath = (String) innerMap.get("savePath");
                        String wasteInfoNoStr =  (String) innerMap.get("wasteInfoNo");
                        String imageIndexNoStr =  (String) innerMap.get("imageIndexNo");
                        int wasteInfoNo = Integer.parseInt(wasteInfoNoStr);
                        int imageIndexNo = Integer.parseInt(imageIndexNoStr);

                        // 이미지 객체 생성
                        Image image = new Image("reservation", rvNo, imageName, imageRename, savePath);
                        System.out.println("image = " + image);
                        // 이미지 객체를 데이터베이스에 삽입
                        int insertResult = reservationStore.insertReservationImage(image);

                        if (insertResult > 0) {
                            // 이미지 객체가 성공적으로 데이터베이스에 삽입됨

                            // 이미지 객체에 이미지 번호를 가져옵니다.
                            Image imageNoSelect = reservationStore.selectImageNo(imageRename);
                            int imageNo = imageNoSelect.getImageNo();

                            // 가져온 이미지 번호와 imageAdd가 가지고 있는 정보로 연결 테이블에 삽입합니다.
                            Connection connection = new Connection();
                            connection.setRvDetailNo(rvNo);
                            connection.setWasteInfoNo(wasteInfoNo);
                            connection.setImageIndexNo(imageIndexNo);
                            connection.setImageNo(imageNo);

                            int insertConnection = reservationStore.insertConnection(connection);

                            if (insertConnection > 0) {
                                result++; // 이미지 삽입이 성공한 경우에만 결과를 증가시킵니다.
                            }
                        } else {
                            // 이미지 객체 삽입에 실패한 경우의 처리
                            System.out.println("필수 필드가 누락되었거나 데이터 형식이 맞지 않습니다.");
                        }
                }
            }
        }
        return result;
    }



}
