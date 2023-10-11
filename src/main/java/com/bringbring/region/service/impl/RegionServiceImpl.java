package com.bringbring.region.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.bringbring.region.service.RegionService;
import com.bringbring.region.store.RegionStore;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class RegionServiceImpl implements RegionService {

	private final RegionStore regionStore;
	
}
