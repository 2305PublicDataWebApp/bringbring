package com.bringbring.admin.store.logic;

import com.bringbring.admin.domain.Admin;
import com.bringbring.admin.domain.AdminDetails;
import com.bringbring.common.PageInfo;
import com.bringbring.user.domain.User;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bringbring.admin.store.AdminStore;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class AdminStoreLogic implements AdminStore {

    private final SqlSession sqlSession;

    @Override
    public int insertAdmin(Admin admin) { return sqlSession.insert("AdminMapper.insertAdmin", admin); }

    @Override
    public int selectListCount() { return sqlSession.selectOne("AdminMapper.selectListCount"); }

    @Override
    public List<AdminDetails> selectAdminDetailsList(PageInfo pInfo) { return sqlSession.selectList("AdminMapper.selectAdminDetailsList", pInfo); }

    @Override
    public int insertRole() { return sqlSession.insert("AdminMapper.insertRole"); }

    @Override
    public int updateRole(int userNo) { return sqlSession.update("AdminMapper.updateRole", userNo); }
}
