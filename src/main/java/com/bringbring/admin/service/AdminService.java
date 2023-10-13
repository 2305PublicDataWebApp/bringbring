package com.bringbring.admin.service;

import com.bringbring.admin.domain.Admin;
import com.bringbring.admin.domain.AdminDetails;
import com.bringbring.common.PageInfo;
import com.bringbring.user.domain.User;

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

    /**
     * 회원 권한 추가 service
     * @param
     * @return int
     */
    int insertRole();

    /**
     * 권한 수정 service
     * @param userNo
     * @return
     */
    int updateRole(int userNo);
}
