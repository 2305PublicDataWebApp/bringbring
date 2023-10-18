package com.bringbring.reservation.service.impl;

import com.bringbring.reservation.domain.WasteCategory;
import com.bringbring.reservation.domain.WasteData;
import com.bringbring.reservation.service.ReservationService;
import com.bringbring.reservation.store.ReservationStore;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
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

    @Override
    public Map<String, Object> insertImages(String[] wasteInfo, MultipartFile[] uploadFiles, HttpServletRequest request) {
        Map<String, Object> result = new HashMap<>();

        // 파일 업로드 및 저장
        List<Map<String, String>> saveImgs = uploadImages(uploadFiles, request);

        // wasteInfoNo 저장
//        result.put("wasteInfoNo", wasteInfNo);

        // 이미지 정보 저장
        result.put("imagePaths", saveImgs);

        // 원하는 다른 데이터도 저장 가능

        return result;
    }


    public List<Map<String, String>> uploadImages(MultipartFile[] uploadFiles, HttpServletRequest request) {
        List<Map<String, String>> imagePaths = new ArrayList<>();

        System.out.println("uploadFiles = " + uploadFiles.length);

        System.out.println("1");
        for (MultipartFile file : uploadFiles) {
            System.out.println("File Name: " + file.getOriginalFilename());
            System.out.println("File Size: " + file.getSize());
            if (!file.isEmpty()) {
                try {
                    // 업로드 저장 경로 생성
        System.out.println("2");
                    String root = request.getSession().getServletContext().getRealPath("resources");
                    String saveFolder = root + "\\assets\\img\\dUploadFiles";
                    File folder = new File(saveFolder);
                    if (!folder.exists()) {
                        folder.mkdir();
                    }

        System.out.println("3");
                    // 파일 이름, 경로 생성
                    String imageName = file.getOriginalFilename(); // 실제 파일명
                    String ext = imageName.substring(imageName.lastIndexOf(".") + 1); // 확장자 추출
                    String imageRename = UUID.randomUUID().toString() + "." + ext; // 파일 리네임 - UUID 객체로 랜덤 생성
                    String savePath = saveFolder + "\\" + imageRename; // 파일 경로

                    // 파일을 저장하는 코드 (예를 들면, Files.copy 또는 FileOutputStream를 사용하여 파일을 저장)
                    // 예시: Files.copy(file.getInputStream(), Paths.get(savePath), StandardCopyOption.REPLACE_EXISTING);

        System.out.println("4");
                    // 이미지 정보를 별도의 맵에 저장
                    Map<String, String> imageInfo = new HashMap<>();
                    imageInfo.put("imageName", imageName);
                    imageInfo.put("imageRename", imageRename);
                    imageInfo.put("savePath", savePath);
                    imagePaths.add(imageInfo);

        System.out.println("5");
                    System.out.println("Image Info: " + imageInfo);

                } catch (IllegalStateException e) {
                    e.printStackTrace();
                }
            }
        }

        return imagePaths;
    }


}
