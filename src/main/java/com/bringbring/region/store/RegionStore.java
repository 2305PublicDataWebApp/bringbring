package com.bringbring.region.store;

import java.util.List;

import com.bringbring.region.domain.City;
import com.bringbring.region.domain.District;

public interface RegionStore {

	List<City> selectCityList();

	List<District> selectDistrictList(int cityNo);

}
