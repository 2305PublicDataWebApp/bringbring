package com.bringbring.divide.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.bringbring.chatting.domain.UserData;
import com.bringbring.common.PageInfo;
import com.bringbring.divide.domain.*;
import com.bringbring.image.domain.Image;
import org.springframework.web.multipart.MultipartFile;

public interface DivideService {


	int insertDivide(Divide divide, MultipartFile[] uploadFiles, HttpServletRequest request);

	int getListCount();

	List<ResponseData> selectResponseDataList(PageInfo pInfo, String searchOption);

    int selectMaxNo();

    DetailData selectDetailDataByNo(int divNo);

	List<Image> selectImageListByNo(int divNo);

    Heart selectHeartByMap(Map<String, Object> map);

	int insertHeart(Heart heart);

	int deleteHeart(Heart heart);

	int getHeartCount(int divNo);

	int deleteDivide(int divNo);

    UpdateData selectUpdateDataByNo(int divNo);

	int updateDivide(Divide divide, MultipartFile[] uploadFiles, int[] deletePreImageNo, HttpServletRequest request);

	Divide selectOneByNo(int divNo);

    int updateViewCount(Divide divide);

	UserData selectUserDataByNo(int divNo);

    List<ResponseData> selectLoginResponseDataList(PageInfo pageInfo, Map<String, Object> map);

    PageInfo getPageInfo(Integer currentPage, int totalCount);

	List<ResponseData> selectLoginResponseDataSearchList(PageInfo pInfo, Map<String, Object> map);

    List<ResponseData> selectResponseDataSearchList(PageInfo pInfo, Map<String, Object> map);

	int getSearchListCount(Map<String, Object> map);

}
