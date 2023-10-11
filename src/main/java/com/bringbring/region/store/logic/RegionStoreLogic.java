package com.bringbring.region.store.logic;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bringbring.region.store.RegionStore;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class RegionStoreLogic implements RegionStore {

	private final SqlSession sqlSession;
}
