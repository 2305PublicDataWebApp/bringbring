package com.bringbring.region.store;

import java.util.List;

import com.bringbring.region.domain.City;
import com.bringbring.region.domain.District;
import com.bringbring.region.domain.Region;

public interface RegionStore {

	List<City> selectCityList();

	List<District> selectDistrictList(int cityNo);

	/**
	 * 지역 조회 store
	 * @return
	 */
    List<Region> selectRegionList(int cityNo);
}
