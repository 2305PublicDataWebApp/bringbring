package com.bringbring.inquire.controller;

import com.bringbring.inquire.domain.Answer;
import com.bringbring.inquire.service.AnswerService;
import com.bringbring.inquire.service.InquireService;
import com.bringbring.inquire.store.AnswerStore;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/answer")
public class AnswerController {

    private final AnswerService answerService;
    private final InquireService inquireService;

    @PostMapping("/insert.do")
    public String insertAnswer(Answer answer){
        answerService.insertAnswer(answer);
        inquireService.updateYn(answer.getInqNo());
        return "redirect:/inquire/detail.do?inqNo="+answer.getInqNo();
    }

    @PostMapping("/update.do")
    public String updateAnswer(Answer answer){
        answerService.updateAnswer(answer);

        return "redirect:/inquire/detail.do?inqNo="+answer.getInqNo();
    }
}
