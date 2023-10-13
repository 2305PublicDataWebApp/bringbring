package com.bringbring.region.service.impl;

import java.util.List;

import com.bringbring.region.domain.Region;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bringbring.region.domain.City;
import com.bringbring.region.domain.District;
import com.bringbring.region.service.RegionService;
import com.bringbring.region.store.RegionStore;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class RegionServiceImpl implements RegionService {

	private final RegionStore regionStore;

	@Override
	public List<City> selectCityList() { return regionStore.selectCityList(); }

	@Override
	public List<District> selectDistrictList(int cityNo) { return regionStore.selectDistrictList(cityNo); }

	@Override
	public List<Region> selectRegionList(int cityNo) { return regionStore.selectRegionList(cityNo);}

}
