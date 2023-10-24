package com.bringbring.inquire.service.Impl;

import com.bringbring.inquire.domain.Answer;
import com.bringbring.inquire.service.AnswerService;
import com.bringbring.inquire.store.AnswerStore;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class AnswerServiceImpl implements AnswerService {

    private final AnswerStore answerStore;

    @Override
    public int insertAnswer(Answer answer) { return answerStore.insertAnswer(answer); }

    @Override
    public int updateAnswer(Answer answer) { return answerStore.updateAnswer(answer); }
}
