package com.bringbring.user.store.logic;

import java.util.List;

import com.bringbring.common.PageInfo;
import org.apache.ibatis.session.RowBounds;
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
	public List<User> selectUserList(PageInfo pInfo) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return sqlSession.selectList("UserMapper.selectUserList", null, rowBounds);
	}

	@Override
	public int insertUser(User user) {
		return sqlSession.insert("UserMapper.insertUser", user);
	}

	@Override
	public User selectOneFindEmail(User user) {
		return sqlSession.selectOne("UserMapper.selectOneFindEmail", user);
	}

	@Override
	public User selectOneById(String userId) { return sqlSession.selectOne("UserMapper.selectOneById", userId); }

	@Override
	public int updateUser(User user) {
		return sqlSession.update("UserMapper.updateUser", user);
	}

	@Override
	public User selectOneFindPwd(User user) {
		return sqlSession.selectOne("UserMapper.selectOneFindPwd", user);
	}

	@Override
	public int selectOneByNo(User user) { return sqlSession.selectOne("UserMapper.selectOneByMaxNo", user);}


}
