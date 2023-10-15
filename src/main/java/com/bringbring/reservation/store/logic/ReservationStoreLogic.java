package com.bringbring.reservation.store.logic;

import com.bringbring.reservation.domain.WasteCategory;
import com.bringbring.reservation.domain.WasteData;
import com.bringbring.reservation.store.ReservationStore;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class ReservationStoreLogic implements ReservationStore {

    private final SqlSession sqlSession;

    @Override
    public List<WasteData> selectWasteList(String selectItem) {
        return this.sqlSession.selectList("ReservationMapper.selectWasteList", selectItem);
    }

    @Override
    public List<WasteCategory> selectWasteCategoryList() {
        return sqlSession.selectList("ReservationMapper.selectWasteCategoryList");
    }

    @Override
    public WasteData selectInfoNoData(Integer wasteInfoNo) {
        return sqlSession.selectOne("ReservationMapper.sleectInfoNoData", wasteInfoNo);
    }
}
