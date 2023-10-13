package com.bringbring.divide.store;

import java.util.List;

import com.bringbring.common.PageInfo;
import com.bringbring.divide.domain.Divide;
import com.bringbring.image.domain.Image;
import com.bringbring.region.domain.District;
import com.bringbring.reservation.domain.WasteCategory;

public interface DivideStore {

	int insertDivide(Divide divide);

	int selectMaxNo();

	void insertImage(Image image);

	int getListCount();

	List<Divide> selectDivideList(PageInfo pInfo);
}
