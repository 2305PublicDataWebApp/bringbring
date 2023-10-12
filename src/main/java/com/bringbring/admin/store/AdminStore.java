package com.bringbring.admin.store;

import com.bringbring.admin.domain.Admin;
import com.bringbring.common.PageInfo;

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
    List<Admin> selectAdminList(PageInfo pInfo);
}
