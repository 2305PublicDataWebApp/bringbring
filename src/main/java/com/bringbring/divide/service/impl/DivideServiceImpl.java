package com.bringbring.divide.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import com.bringbring.chatting.domain.UserData;
import com.bringbring.common.PageInfo;
import com.bringbring.divide.domain.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bringbring.divide.service.DivideService;
import com.bringbring.divide.store.DivideStore;
import com.bringbring.image.domain.Image;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class DivideServiceImpl implements DivideService{

	private final DivideStore divideStore;

	@Override
	public int insertDivide(Divide divide, MultipartFile[] uploadFiles, HttpServletRequest request) {
			// 1. db에 먼저 게시글 정보 저장
			int result = divideStore.insertDivide(divide);
			int imageGroupNo = 0;
			// 2. 저장성공시 파일업로드
			if(result > 0) {
				imageGroupNo = divide.getDivNo();
				for(MultipartFile uploadFile : uploadFiles) {
					if(uploadFile != null && !uploadFile.isEmpty()) {
						//파일저장 메소드 호출
						Map<String, Object> imageMap = this.saveFile(uploadFile, request);
						String imageName = (String)imageMap.get("imageName");
						String imageRename = (String)imageMap.get("imageRename");
						String imagePath = (String)imageMap.get("imagePath");
						Image image = new Image("divide" ,imageGroupNo, imageName, imageRename, imagePath);
						divideStore.insertImage(image);
					}
				}
			}
			return imageGroupNo;
	}

	@Override
	public int getListCount() { return divideStore.getListCount(); }

	@Override
	public List<ResponseData> selectResponseDataList(PageInfo pInfo, String searchOption) { return divideStore.selectResponseDataList(pInfo, searchOption); }

	@Override
	public int selectMaxNo() { return divideStore.selectMaxNo(); }

	@Override
	public DetailData selectDetailDataByNo(int divNo) { return divideStore.selectDetailDataByNo(divNo); }

	@Override
	public List<Image> selectImageListByNo(int divNo) { return divideStore.selectImageListByNo(divNo); }

	@Override
	public Heart selectHeartByMap(Map<String, Object> map) { return divideStore.selectHeartByMap(map); }

	@Override
	public int insertHeart(Heart heart) { return divideStore.insertHeart(heart); }

	@Override
	public int deleteHeart(Heart heart) { return divideStore.deleteHeart(heart); }

	@Override
	public int getHeartCount(int divNo) { return divideStore.getHeartCount(divNo); }

	@Override
	public int deleteDivide(int divNo) { return divideStore.deleteDivide(divNo); }

	@Override
	public UpdateData selectUpdateDataByNo(int divNo) { return divideStore.selectUpdateDataByNo(divNo); }

	@Override
	public int updateDivide(Divide divide
			, @RequestParam (value="uploadFiles", required = false) MultipartFile[] uploadFiles
			, @RequestParam (value="deletePreImageNo", required = false) int[] deletePreImageNo
			, HttpServletRequest request) {
		int result = divideStore.updateDivide(divide);
		if(result > 0) {
			if (deletePreImageNo != null) {
				if(deletePreImageNo.length > 0){
					for (int j : deletePreImageNo) {
						divideStore.deleteImage(j);
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
						Image image = new Image("divide" ,divide.getDivNo(), imageName, imageRename, imagePath);
						divideStore.insertImage(image);
					}
				}
			}
		}
		return result;
	}

	@Override
	public Divide selectOneByNo(int divNo) { return divideStore.selectOneByNo(divNo); }

	@Override
	public int updateViewCount(Divide divide) { return divideStore.updateViewCount(divide); }

	@Override
	public UserData selectUserDataByNo(int divNo) { return divideStore.selectUserDataByNo(divNo); }

	@Override
	public List<ResponseData> selectLoginResponseDataList(PageInfo pageInfo, Map<String, Object> map) { return divideStore.selectLoginResponseDataList(pageInfo, map); }

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
	public List<ResponseData> selectLoginResponseDataSearchList(PageInfo pInfo, Map<String, Object> map) { return divideStore.selectLoginResponseDataSearchList(pInfo, map); }

    @Override
    public List<ResponseData> selectResponseDataSearchList(PageInfo pInfo, Map<String, Object> map) { return divideStore.selectResponseDataSearchList(pInfo, map); }

    @Override
    public int getSearchListCount(Map<String, Object> map) {
        return divideStore.getSearchListCount(map);
    }


	private Map<String, Object> saveFile(MultipartFile uploadFile, HttpServletRequest request) {
		Map<String, Object> fileInfoMap = new HashMap<String, Object>();
		try {
			//업로드 저장 경로생성
			String root = request.getSession().getServletContext().getRealPath("resources");
			String saveFolder = root + "\\assets\\img\\dUploadFiles";
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
			String dbPath = "../resources/assets/img/dUploadFiles/" + imageRename;
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
		String delImagepath = root+"\\dUploadFiles\\"+imageRename;
		File file = new File(delImagepath);
		if(file.exists()) {
			file.delete();
		}
	}

}
