package com.bringbring.config.divide.store;

import java.util.List;

import com.bringbring.reservation.domain.WasteCategory;

public interface DivideStore {

	List<WasteCategory> selectWasteCategoryList();

}
