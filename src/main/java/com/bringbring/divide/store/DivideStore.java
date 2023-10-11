package com.bringbring.divide.store;

import java.util.List;

import com.bringbring.divide.domain.Divide;
import com.bringbring.image.domain.Image;
import com.bringbring.reservation.domain.WasteCategory;

public interface DivideStore {

	List<WasteCategory> selectWasteCategoryList();

	int insertDivide(Divide divide);

	int selectMaxNo();

	void insertImage(Image image);

}
