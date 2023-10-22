package com.bringbring.chatting.controller;

import com.bringbring.chatting.domain.Chat;
import com.bringbring.chatting.service.ChatService;
import com.bringbring.region.domain.District;
import com.google.gson.Gson;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@RestController
@RequiredArgsConstructor
@Log4j2
public class RoomController {

    private final ChatService chatService;

    //채팅방 개설
    @MessageMapping("/message")
    @SendTo("/sub/chatting")
    public ResponseEntity<List<Chat>> create(
            @PathVariable int chatroomNo
    ) {

        List<Chat> chatList = chatService.selectChatRoomListByNo(chatroomNo);
//        model.addAttribute("cList", chatList);
//        return "redirect:/chatting?userId="+chatList.get(0).;
        return ResponseEntity.ok(chatList);
    }

}