package com.bringbring.inquire.service.Impl;

import com.bringbring.common.PageInfo;
import com.bringbring.divide.domain.Divide;
import com.bringbring.image.domain.Image;
import com.bringbring.inquire.domain.*;
import com.bringbring.inquire.store.InquireStore;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.bringbring.inquire.domain.Inquire;
import com.bringbring.inquire.service.InquireService;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Transactional
public class InquireServiceImpl implements InquireService {

    private final InquireStore inquireStore;
    @Override
    public int selectInqListCount() { return inquireStore.selectInqListCount(); }

    @Override
    public List<InquireDetails> selectInquireList(PageInfo pInfo) { return inquireStore.selectInquireList(pInfo);}

    @Override
    public List<InquireDetails> selectInquiriesByAnswer(InquireDetails inquireDetails, PageInfo pInfo) { return inquireStore.selectInquiriesByAnswer(inquireDetails, pInfo);}

    @Override
    public List<InquireDetails> selectInquireByCityNo(InquireDetails inquireDetails, PageInfo pInfo) { return inquireStore.selectInquireByCityNo(inquireDetails, pInfo); }

    @Override
    public int selectInquireCount(char answerYn) { return inquireStore.selectInquireCount(answerYn);}

    @Override
    public int selectInquireCountByCity(int cityNo) { return inquireStore.selectInquireCountByCity(cityNo); }

    @Override
    public List<InquireDetails> searchInquireByKeyword(PageInfo pInfo, Map<String, String> paramMap) {  return inquireStore.searchInquireByKeyword(pInfo, paramMap); }

    @Override
    public int searchInqListCount(Map<String, String> paramMap) { return inquireStore.searchInqListCount(paramMap); }
  
    @Override
	  public List<Inquire> selectInquireListByUserNo(int userNo) { return inquireStore.selectInquireListByUserNo(userNo); }

    @Override
    public PageInfo getPageInfo(Integer currentPage, int totalCount) {
        PageInfo pi = null;
        int recordCountPerPage = 10;
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
    public int getListCountByNo(int userNo) { return inquireStore.getListCountByNo(userNo); }

    @Override
    public List<Inquire> selectPageInquireListByNo(PageInfo pInfo, int userNo) { return inquireStore.selectPageInquireListByNo(pInfo, userNo); }

    @Override
    public int insertInquire(Inquire inquire, MultipartFile[] uploadFiles, HttpServletRequest request) {
        // 1. db에 먼저 게시글 정보 저장
        int result = inquireStore.insertInquire(inquire);
        // 2. 저장성공시 파일업로드
        if(result > 0) {
            int imageGroupNo = inquireStore.selectMaxNo();
            for(MultipartFile uploadFile : uploadFiles) {
                if(uploadFile != null && !uploadFile.isEmpty()) {
                    //파일저장 메소드 호출
                    Map<String, Object> imageMap = this.saveFile(uploadFile, request);
                    String imageName = (String)imageMap.get("imageName");
                    String imageRename = (String)imageMap.get("imageRename");
                    String imagePath = (String)imageMap.get("imagePath");
                    Image image = new Image("inquire" ,imageGroupNo, imageName, imageRename, imagePath);
                    inquireStore.insertImage(image);
                }
            }
        }
        return result;
    }

    @Override
    public InquireDetail selectInquireDetailByNo(int inqNo) { return inquireStore.selectInquireDetailByNo(inqNo); }

    @Override
    public List<Image> selectImageList(int inqNo) { return inquireStore.selectImageList(inqNo); }

    @Override
    public InquireDetail encodingDetail(InquireDetail inquireDetail) {

        if (inquireDetail != null && "delivery".equals(inquireDetail.getInquire().getInqCategory())) {
            inquireDetail.getInquire().setInqCategory("수거 연착, 배송 환불 관련 문의사항");
        }else if (inquireDetail != null && "divide".equals(inquireDetail.getInquire().getInqCategory())) {
            inquireDetail.getInquire().setInqCategory("나눔 게시판 관련 문의사항");
        }else if (inquireDetail != null && "chatting".equals(inquireDetail.getInquire().getInqCategory())) {
            inquireDetail.getInquire().setInqCategory("채팅 관련 문의사항");
        }else if (inquireDetail != null && "improvement".equals(inquireDetail.getInquire().getInqCategory())) {
            inquireDetail.getInquire().setInqCategory("개선하면 좋을 점");
        }else if (inquireDetail != null && "etc".equals(inquireDetail.getInquire().getInqCategory())) {
            inquireDetail.getInquire().setInqCategory("기타");
        }
        return inquireDetail;
    }

    @Override
    public InquireUpdate selectInquireUpdate(int inqNo) { return inquireStore.selectInquireUpdate(inqNo); }

    @Override
    public int updateInquire(Inquire inquire
            , @RequestParam(value="uploadFiles", required = false) MultipartFile[] uploadFiles
            , @RequestParam (value="deletePreImageNo", required = false) int[] deletePreImageNo
            , HttpServletRequest request) {
        int result = inquireStore.updateInquire(inquire);
        if(result > 0) {
            if (deletePreImageNo != null) {
                if(deletePreImageNo.length > 0){
                    for (int j : deletePreImageNo) {
                        inquireStore.deleteImage(j);
                    }
                }
            }
            if(uploadFiles.length > 0){
                for(MultipartFile uploadFile : uploadFiles) {
                    if(uploadFile != null && !uploadFile.isEmpty()) {
                        //파일저장 메소드 호출
                        Map<String, Object> imageMap = this.saveFile(uploadFile, request);
                        String imageName = (String)imageMap.get("imageName");
                        String imageRename = (String)imageMap.get("imageRename");
                        String imagePath = (String)imageMap.get("imagePath");
                        Image image = new Image("inquire" ,inquire.getInqNo(), imageName, imageRename, imagePath);
                        inquireStore.insertImage(image);
                    }
                }
            }
        }
        return result;
    }

    @Override
    public int deleteInquire(int inqNo) { return inquireStore.deleteInquire(inqNo); }

    @Override
    public int updateYn(int inqNo) { return inquireStore.updateYn(inqNo); }

    private Map<String, Object> saveFile(MultipartFile uploadFile, HttpServletRequest request) {
        Map<String, Object> fileInfoMap = new HashMap<String, Object>();
        try {
            //업로드 저장 경로생성
            String root = request.getSession().getServletContext().getRealPath("resources");
            String saveFolder = root + "\\assets\\img\\iUploadFiles";
            File folder = new File(saveFolder);
            if(!folder.exists()) folder.mkdir();

            // 파일 이름, 경로 생성
            String imageName = uploadFile.getOriginalFilename(); 					// 실제파일명
            String ext = imageName.substring(imageName.lastIndexOf(".")+1);   // 확장자 추출
            String imageRename = UUID.randomUUID().toString() + "." + ext; 		// 파일리네임 - UUID객체로 랜덤 생성
            String savePath = saveFolder + "\\" + imageRename; 					// 파일경로

            //파일 객체 생성 후 실제파일저장
            File file = new File(savePath);
            uploadFile.transferTo(file);
            String dbPath = "../resources/assets/img/iUploadFiles/" + imageRename;
            //Map 저장
            fileInfoMap.put("imageName", imageName);
            fileInfoMap.put("imageRename", imageRename);
            fileInfoMap.put("imagePath", dbPath);
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return fileInfoMap;
    }

    private void deleteFile(HttpServletRequest request, String imageRename) {
        String root = request.getSession().getServletContext().getRealPath("resources");
        String delImagepath = root+"\\iUploadFiles\\"+imageRename;
        File file = new File(delImagepath);
        if(file.exists()) {
            file.delete();
        }
    }

}
