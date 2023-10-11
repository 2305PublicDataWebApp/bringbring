package com.bringbring.divide.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.bringbring.divide.domain.Divide;
import com.bringbring.reservation.domain.WasteCategory;

public interface DivideService {

	List<WasteCategory> selectWasteCategoryList();

	int insertDivide(Divide divide, MultipartFile[] uploadFiles, HttpServletRequest request);

}
