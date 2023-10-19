package com.bringbring.divide.store;

import java.util.List;
import java.util.Map;

import com.bringbring.chatting.domain.UserData;
import com.bringbring.common.PageInfo;
import com.bringbring.divide.domain.*;
import com.bringbring.image.domain.Image;
import com.bringbring.region.domain.District;
import com.bringbring.reservation.domain.WasteCategory;

public interface DivideStore {

	int insertDivide(Divide divide);

	int selectMaxNo();

	void insertImage(Image image);

	int getListCount();

	List<ResponseData> selectResPonseDataList(PageInfo pInfo);

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
}
