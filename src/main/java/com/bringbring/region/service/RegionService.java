package com.bringbring.region.service;

import java.util.List;

import com.bringbring.region.domain.City;
import com.bringbring.region.domain.District;

public interface RegionService {
	
	List<City> selectCityList();
	List<District> selectDistrictList(int cityNo);

}
