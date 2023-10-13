package com.bringbring.admin.store;

import com.bringbring.admin.domain.Admin;
import com.bringbring.admin.domain.AdminDetails;
import com.bringbring.common.PageInfo;
import com.bringbring.user.domain.User;

import java.util.List;

public interface AdminStore {

    /**
     * 관리자 추가 store
     * @param admin
     * @return int
     */
    int insertAdmin(Admin admin);

    /**
     * 관리자 수 조회 store
     * @return int
     */
    int selectListCount();

    /**
     * 관리자 리스트 조회 store
     * @param pInfo
     * @return List<Admin>
     */
    List<AdminDetails> selectAdminDetailsList(PageInfo pInfo);

    /**
     * 권한 추가 store
     * @param
     * @return int
     */
    int insertRole();

    /**
     * 권한 수정 store
     * @param userNo
     * @return
     */
    int updateRole(int userNo);
}
