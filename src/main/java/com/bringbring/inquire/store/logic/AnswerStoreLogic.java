package com.bringbring.inquire.store.logic;

import com.bringbring.inquire.domain.Answer;
import com.bringbring.inquire.store.AnswerStore;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class AnswerStoreLogic implements AnswerStore {

    private final SqlSession sqlSession;

    @Override
    public int insertAnswer(Answer answer) { return sqlSession.insert("InquireMapper.insertAnswer", answer); }

    @Override
    public int updateAnswer(Answer answer) { return sqlSession.update("InquireMapper.updateAnswer", answer); }
}
