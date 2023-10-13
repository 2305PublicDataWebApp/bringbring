package com.bringbring.divide.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.bringbring.common.PageInfo;
import com.bringbring.region.domain.District;
import org.springframework.web.multipart.MultipartFile;

import com.bringbring.divide.domain.Divide;
import com.bringbring.reservation.domain.WasteCategory;

public interface DivideService {


	int insertDivide(Divide divide, MultipartFile[] uploadFiles, HttpServletRequest request);

	int getListCount();

	List<Divide> selectDivideList(PageInfo pInfo);
}
