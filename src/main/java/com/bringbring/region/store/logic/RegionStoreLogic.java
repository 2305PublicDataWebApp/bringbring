package com.bringbring.region.store.logic;

import java.util.List;

import com.bringbring.region.domain.Region;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bringbring.region.domain.City;
import com.bringbring.region.domain.District;
import com.bringbring.region.store.RegionStore;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class RegionStoreLogic implements RegionStore {

	private final SqlSession sqlSession;

	@Override
	public List<City> selectCityList() { return sqlSession.selectList("RegionMapper.selectCityList"); }

	@Override
	public List<District> selectDistrictList(int cityNo) { return sqlSession.selectList("RegionMapper.selectDistrictList", cityNo); }

	@Override
	public List<Region> selectRegionList(int cityNo) { return sqlSession.selectList("RegionMapper.selectRegionList", cityNo); }
}
