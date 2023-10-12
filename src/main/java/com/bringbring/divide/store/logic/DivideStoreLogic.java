package com.bringbring.divide.store.logic;

import java.util.List;

import com.bringbring.region.domain.District;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bringbring.divide.domain.Divide;
import com.bringbring.divide.store.DivideStore;
import com.bringbring.image.domain.Image;
import com.bringbring.reservation.domain.WasteCategory;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class DivideStoreLogic implements DivideStore{

	private final SqlSession sqlSession;

	@Override
	public int insertDivide(Divide divide) {
		return sqlSession.insert("DivideMapper.insertDivide", divide);
	}

	@Override
	public int selectMaxNo() {
		return sqlSession.selectOne("DivideMapper.selectMaxNo");
	}

	@Override
	public void insertImage(Image image) {
		sqlSession.insert("DivideMapper.insertImage", image);
	}

}
