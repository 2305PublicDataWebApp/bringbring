package com.bringbring.chatting.controller;

import com.bringbring.chatting.domain.Chat;
import com.bringbring.chatting.service.ChatService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/chatting")
public class RestChatController {

    private final ChatService chatService;

    @PostMapping("insert.do")
    public String insertChat(Chat chat) {

        int result = chatService.insertChat(chat);
        if(result > 0){
            return "success";
        }
        return "false";
    }
}
