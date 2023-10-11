package com.bringbring.config.divide.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bringbring.config.divide.service.DivideService;
import com.bringbring.config.divide.store.DivideStore;
import com.bringbring.reservation.domain.WasteCategory;

import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class DivideServiceImpl implements DivideService{

	private final DivideStore divideStore;
	
	@Override
	@Transactional(readOnly = true)
	public List<WasteCategory> selectWasteCategoryList() {
		return divideStore.selectWasteCategoryList();
	}

}
