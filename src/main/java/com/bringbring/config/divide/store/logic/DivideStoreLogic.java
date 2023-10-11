package com.bringbring.config.divide.store.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bringbring.config.divide.store.DivideStore;
import com.bringbring.reservation.domain.WasteCategory;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class DivideStoreLogic implements DivideStore{

	private final SqlSession sqlSession;
	
	@Override
	public List<WasteCategory> selectWasteCategoryList() {
		return sqlSession.selectList("DivideMapper.selectWasteCategoryList");
	}

}
