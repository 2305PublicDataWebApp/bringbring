package com.bringbring.admin.service.impl;


import com.bringbring.admin.domain.Admin;
import com.bringbring.admin.domain.AdminDetails;
import com.bringbring.admin.store.AdminStore;
import com.bringbring.common.PageInfo;
import com.bringbring.user.domain.User;
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
    public int insertAdmin(Admin admin) {
        int result = adminStore.insertAdmin(admin);
        if(result>0) {
            int userNo = admin.getUserNo();
            int roleResult = updateRole(userNo);

            if (roleResult > 0) {
                return result;
            } else {
                throw new RuntimeException("롤 정보 업데이트 실패"); // 롤 업데이트 실패 시 롤백을 위해 예외를 던집니다.
            }
        } else {
            throw new RuntimeException("관리자 정보 추가 실패"); // 관리자 정보 추가 실패 시 롤백을 위해 예외를 던집니다.
        }
    }
    @Override
    public int selectListCount() { return adminStore.selectListCount(); }

    @Override
    public List<AdminDetails> selectAdminDetailsList(PageInfo pInfo) { return adminStore.selectAdminDetailsList(pInfo); }

    @Override
    public int insertRole() { return adminStore.insertRole();}

    @Override
    public int updateRole(int userNo) { return adminStore.updateRole(userNo); }


}
