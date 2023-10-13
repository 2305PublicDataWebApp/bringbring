package com.bringbring.user.store.logic;

import java.util.List;

import com.bringbring.common.PageInfo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bringbring.user.domain.User;
import com.bringbring.user.store.UserStore;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class UserStoreLogic implements UserStore{
	
	private final SqlSession sqlSession;

	@Override
	public User selectCheckLogin(User user) {
		return sqlSession.selectOne("UserMapper.selectCheckLogin", user);
	}

	@Override
	public int selectListCount() { return sqlSession.selectOne("UserMapper.selectListCount"); }

	@Override
	public List<User> selectUserList(PageInfo pInfo) { return sqlSession.selectList("UserMapper.selectUserList"); }

	@Override
	public int insertUser(User user) {
		return sqlSession.insert("UserMapper.insertUser", user);
	}

	@Override
	public User selectOneByName(User user) {
		return sqlSession.selectOne("UserMapper.selectOneByName", user);
	}

    @Override
    public User selectOneById(String userId) { return sqlSession.selectOne("UserMapper.selectOneById", userId); }

}
