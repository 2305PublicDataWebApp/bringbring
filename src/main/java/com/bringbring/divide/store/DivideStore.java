package com.bringbring.divide.store;

import java.util.List;
import java.util.Map;

import com.bringbring.chatting.domain.UserData;
import com.bringbring.common.PageInfo;
import com.bringbring.divide.domain.*;
import com.bringbring.image.domain.Image;

public interface DivideStore {

	int insertDivide(Divide divide);

	int selectMaxNo();

	void insertImage(Image image);

	int getListCount();

	List<ResponseData> selectResponseDataList(PageInfo pInfo, String searchOption);

    Divide selectOneByNo(int divNo);

	DetailData selectDetailDataByNo(int divNo);

	List<Image> selectImageListByNo(int divNo);

    Heart selectHeartByMap(Map<String, Object> map);

	int insertHeart(Heart heart);

	int deleteHeart(Heart heart);

	int getHeartCount(int divNo);

	int deleteDivide(int divNo);

    UpdateData selectUpdateDataByNo(int divNo);

	int updateDivide(Divide divide);

    int updateViewCount(Divide divide);

	UserData selectUserDataByNo(int divNo);

    List<ResponseData> selectLoginResponseDataList(PageInfo pageInfo, Map<String, Object> map);

    int deleteImage(int imageNo);

	List<ResponseData> selectLoginResponseDataSearchList(PageInfo pInfo, Map<String, Object> map);

    List<ResponseData> selectResponseDataSearchList(PageInfo pInfo, Map<String, Object> map);

    int getSearchListCount(Map<String, Object> map);
}
