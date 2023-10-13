package com.bringbring.region.service;

import java.util.List;

import com.bringbring.region.domain.City;
import com.bringbring.region.domain.District;
import com.bringbring.region.domain.Region;

public interface RegionService {
	
	List<City> selectCityList();
	List<District> selectDistrictList(int cityNo);

	/**
	 * 지역 조회 service
	 * @return
	 */
    List<Region> selectRegionList(int cityNo);
}
