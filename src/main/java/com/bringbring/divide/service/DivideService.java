package com.bringbring.divide.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.bringbring.common.PageInfo;
import com.bringbring.divide.domain.DetailData;
import com.bringbring.divide.domain.Heart;
import com.bringbring.divide.domain.ResponseData;
import com.bringbring.image.domain.Image;
import com.bringbring.region.domain.District;
import org.springframework.web.multipart.MultipartFile;

import com.bringbring.divide.domain.Divide;
import com.bringbring.reservation.domain.WasteCategory;

public interface DivideService {


	int insertDivide(Divide divide, MultipartFile[] uploadFiles, HttpServletRequest request);

	int getListCount();

	List<ResponseData> selectResPonseDataList(PageInfo pInfo);

    int selectMaxNo();

    DetailData selectDetailDataByNo(int divNo);

	List<Image> selectImageListByNo(int divNo);

    Heart selectHeartByMap(Map<String, Object> map);

	int insertHeart(Heart heart);

	int deleteHeart(int heartNo);
}
