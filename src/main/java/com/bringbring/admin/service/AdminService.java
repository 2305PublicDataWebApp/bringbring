package com.bringbring.admin.service;

import com.bringbring.admin.domain.Admin;
import com.bringbring.admin.domain.AdminDetails;
import com.bringbring.admin.domain.Role;
import com.bringbring.common.PageInfo;
import com.bringbring.user.domain.User;

import java.util.List;
import java.util.Map;

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
     * @return int
     */
    int updateRole(int userNo);

    /**
     * 유저 번호로 권한 조회 service
     * @param userNo
     * @return role
     */
    Role selectRoleByNo(int userNo);

    /**
     * 탈퇴한 유저 수 조회 service
     * @return int
     */
    int selectDeletedUserCount();

    /**
     * 관리자 확인 service
     * @param userNo
     * @return int
     */
    int countAlreadyAdmin(int userNo);

    /**
     * 조건에 따라 키워드에 맞는 갯수 수 조회 service
     * @param paramMap
     * @return int
     */
    int getListCount(Map<String, String> paramMap);

    /**
     * 조건에 따라 키워드로 검색 Service
     * @param pageInfo
     * @param paramMap
     * @return List<User>
     */
    List<User> searchUserByKeyword(PageInfo pageInfo, Map<String, String> paramMap);

    /**
     * 조건에 따라 키워드에 맞는 갯수 수 조회 service
     * @param paramMap
     * @return int
     */
    int getListAdminCount(Map<String, String> paramMap);

    /**
     * 조건에 따라 키워드로 검색 Service
     * @param pInfo
     * @param paramMap
     * @return List<AdminDetails>
     */
    List<AdminDetails> searchAdminByKeyword(PageInfo pInfo, Map<String, String> paramMap);

    /**
     * 관리자 삭제 service
     * @param adminDetails
     * @return int
     */
    int deleteAdmin(AdminDetails adminDetails);

    /**
     * 권한 수정 관리자->일반 service
     * @param userNo
     * @return int
     */
    int updateRoleDownGrade(int userNo);
}
