package com.bringbring.admin.service.impl;


import com.bringbring.admin.domain.Admin;
import com.bringbring.admin.domain.AdminDetails;
import com.bringbring.admin.domain.Role;
import com.bringbring.admin.store.AdminStore;
import com.bringbring.common.PageInfo;
import com.bringbring.user.domain.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.bringbring.admin.service.AdminService;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

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

    @Override
    public Role selectRoleByNo(int userNo) { return adminStore.selectRoleByNo(userNo); }

    @Override
    public int selectDeletedUserCount() { return adminStore.selectDeletedUserCount(); }

    @Override
    public int countAlreadyAdmin(int userNo) { return adminStore.countAlreadyAdmin(userNo);}

    @Override
    public int getListCount(Map<String, String> paramMap) { return adminStore.getListCount(paramMap);}

    @Override
    public List<User> searchUserByKeyword(PageInfo pageInfo, Map<String, String> paramMap) { return adminStore.searchUserByKeyword(pageInfo, paramMap); }

    @Override
    public int getListAdminCount(Map<String, String> paramMap) { return adminStore.getListAdminCount(paramMap); }

    @Override
    public List<AdminDetails> searchAdminByKeyword(PageInfo pInfo, Map<String, String> paramMap) { return adminStore.searchAdminByKeyword(pInfo, paramMap);}

    @Override
    public int deleteAdmin(AdminDetails adminDetails) {
        int result = adminStore.deleteAdmin(adminDetails);
        if (result > 0) {
            int roleResult = updateRoleDownGrade(adminDetails.getUserNo());
            if (roleResult > 0) {
                // 롤 정보도 성공적으로 삽입되었으면 성공 반환
                return result;
            } else {
                // 롤 정보 삽입 실패 시 롤백을 위해 RuntimeException 던지기
                throw new RuntimeException("롤 정보 수정에 실패하였습니다.");
            }
        } else {
            // 회원 정보 삽입 실패 시 롤백을 위해 RuntimeException 던지기
            throw new RuntimeException("회원 정보 수정에 실패 하였습니다.");
        }
    }
    @Override
    public int updateRoleDownGrade(int userNo) { return adminStore.updateRoleDownGrade(userNo);}

    @Override
    public int deleteUser(User user) {
        int result = adminStore.deleteUser(user);
        if(result>0){
            int deleteRole = deleteRole(user.getUserNo());
            if(deleteRole > 0){
                return result;
            } else {
                throw new RuntimeException("롤 정보 삭제에 실패하였습니다.");
            }
        } else {
            throw new RuntimeException("회원 삭제에 실패 하였습니다.");
        }
    }

    @Override
    public int deleteRole(int userNo) { return adminStore.deleteRole(userNo);}

}
