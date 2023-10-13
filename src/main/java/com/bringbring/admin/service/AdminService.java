package com.bringbring.admin.service;

import com.bringbring.admin.domain.Admin;
import com.bringbring.admin.domain.AdminDetails;
import com.bringbring.common.PageInfo;

import java.util.List;

public interface AdminService {

    /**
     * 관리자 추가 service
     * @param admin
     * @return int
     */
    int insertAdmin(Admin admin);

    /**
     * 관리자 수 조회 service
     * @return int
     */
    int selectListCount();

    /**
     * 과리자 리스트 조회 service
     * @param pInfo
     * @return List<Admin>
     */
    List<AdminDetails> selectAdminDetailsList(PageInfo pInfo);
}
