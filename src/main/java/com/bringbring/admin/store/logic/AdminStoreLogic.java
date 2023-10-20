package com.bringbring.admin.store.logic;

import com.bringbring.admin.domain.Admin;
import com.bringbring.admin.domain.AdminDetails;
import com.bringbring.admin.domain.Role;
import com.bringbring.common.PageInfo;
import com.bringbring.report.domain.ReportDetails;
import com.bringbring.reservation.domain.Reservation;
import com.bringbring.reservation.domain.ReservationAdmin;
import com.bringbring.user.domain.User;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bringbring.admin.store.AdminStore;

import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class AdminStoreLogic implements AdminStore {

    private final SqlSession sqlSession;

    @Override
    public int insertAdmin(Admin admin) {
        return sqlSession.insert("AdminMapper.insertAdmin", admin);
    }

    @Override
    public int selectListCount() {
        return sqlSession.selectOne("AdminMapper.selectListCount");
    }

    @Override
    public List<AdminDetails> selectAdminDetailsList(PageInfo pInfo) {
        int limit = pInfo.getRecordCountPerPage();
        int offset = (pInfo.getCurrentPage() - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);
        return sqlSession.selectList("AdminMapper.selectAdminDetailsList", null, rowBounds);
    }

    @Override
    public int insertRole() {
        return sqlSession.insert("AdminMapper.insertRole");
    }

    @Override
    public int updateRole(int userNo) {
        return sqlSession.update("AdminMapper.updateRole", userNo);
    }

    @Override
    public Role selectRoleByNo(int userNo) {
        return sqlSession.selectOne("AdminMapper.selectRoleByNo", userNo);
    }

    @Override
    public int selectDeletedUserCount() {
        return sqlSession.selectOne("AdminMapper.selectDeletedUserCount");
    }

    @Override
    public int countAlreadyAdmin(int userNo) {
        return sqlSession.selectOne("AdminMapper.countAlreadyAdmin", userNo);
    }

    @Override
    public int getListCount(Map<String, String> paramMap) {
        return sqlSession.selectOne("AdminMapper.getListCount", paramMap);
    }

    @Override
    public List<User> searchUserByKeyword(PageInfo pageInfo, Map<String, String> paramMap) {
        int limit = pageInfo.getRecordCountPerPage();
        int offset = (pageInfo.getCurrentPage() - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);
        return sqlSession.selectList("AdminMapper.searchUserByKeyword", paramMap, rowBounds);
    }

    @Override
    public int getListAdminCount(Map<String, String> paramMap) {
        return sqlSession.selectOne("AdminMapper.getListAdminCount", paramMap);
    }

    @Override
    public List<AdminDetails> searchAdminByKeyword(PageInfo pInfo, Map<String, String> paramMap) {
        int limit = pInfo.getRecordCountPerPage();
        int offset = (pInfo.getCurrentPage() - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);
        return sqlSession.selectList("AdminMapper.searchAdminByKeyword", paramMap, rowBounds);
    }

    @Override
    public int deleteAdmin(AdminDetails adminDetails) {
        return sqlSession.delete("AdminMapper.deleteAdmin", adminDetails);
    }

    @Override
    public int updateRoleDownGrade(int userNo) {
        return sqlSession.update("AdminMapper.updateRoleDownGrade", userNo);
    }

    @Override
    public int deleteUser(User user) {
        return sqlSession.delete("AdminMapper.deleteUser", user);
    }

    @Override
    public int deleteRole(int userNo) {
        return sqlSession.delete("AdminMapper.deleteRole", userNo);
    }

    @Override
    public int selectListResCount() { return sqlSession.selectOne("ReservationMapper.selectListResCount"); }

    @Override
    public int selectListCountByCompletionY() { return sqlSession.selectOne("ReservationMapper.selectListCountByCompletionY"); }

    @Override
    public int selectListCountByCompletionN() { return sqlSession.selectOne("ReservationMapper.selectListCountByCompletionN"); }

    @Override
    public List<ReservationAdmin> selectReservationList(PageInfo pInfo) {
        int limit = pInfo.getRecordCountPerPage();
        int offset = (pInfo.getCurrentPage() - 1) * limit;
        RowBounds rowBounds = new RowBounds(offset, limit);
        return sqlSession.selectList("ReservationMapper.selectReservationList", null, rowBounds);
    }

}
