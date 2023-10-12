package com.bringbring.admin.service.impl;


import com.bringbring.admin.domain.Admin;
import com.bringbring.admin.store.AdminStore;
import com.bringbring.common.PageInfo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.bringbring.admin.service.AdminService;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class AdminServiceImpl implements AdminService  {

    private final AdminStore adminStore;
    @Override
    public int insertAdmin(Admin admin) { return adminStore.insertAdmin(admin); }

    @Override
    public int selectListCount() { return adminStore.selectListCount(); }

    @Override
    public List<Admin> selectAdminList(PageInfo pInfo) { return adminStore.selectAdminList(pInfo); }
}
