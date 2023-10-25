package com.bringbring.inquire.store;

import com.bringbring.inquire.domain.Answer;

public interface AnswerStore {
    int insertAnswer(Answer answer);

    int updateAnswer(Answer answer);
}
