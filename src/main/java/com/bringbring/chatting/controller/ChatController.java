package com.bringbring.chatting.controller;

import com.bringbring.chatting.domain.Chat;
import com.bringbring.chatting.domain.UserData;
import com.bringbring.chatting.service.ChatService;
import com.bringbring.divide.service.DivideService;
import com.bringbring.user.domain.User;
import com.bringbring.user.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.net.Socket;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
//@ServerEndpoint("/chatting")
@RequestMapping("/chatting")
public class ChatController extends Socket {
//    private static final List<Session> session = new ArrayList<>();

    private final DivideService divideService;
    private final UserService userService;
    private final ChatService chatService;


    @GetMapping("/{id}")
    public String chattingRoom(@PathVariable String id
            , HttpSession session
            , Model model
            , int divNo
            , String getUserId){

        UserData userData = divideService.selectUserDataByNo(divNo);
        String userId = (String)session.getAttribute("sessionId");
        Map<String, Object> map;
        if(!id.equals(getUserId)){
            User user = userService.selectOneById(userId);
            User getUser = userService.selectOneById(getUserId);
            map = new HashMap<String, Object>();
//            작성자랑 채팅시작자가 다를 때
            map.put("divNo", divNo);
            map.put("userNo", user.getUserNo());
            map.put("getUserNo", userData.getUser().getUserNo());
            List<Chat> chatList = chatService.selectChatListByMap(map);
            model.addAttribute("name", user.getUserName()).addAttribute("user", user);
            model.addAttribute("cList", chatList).addAttribute("getUser", getUser);

        }else if(id.equals("admin@kh.com")){
            getUserId = "khuser01@kh.com";
            User user = userService.selectOneById(userId);
            User getUser = userService.selectOneById(getUserId);
            map = new HashMap<String, Object>();
//            작성자랑 채팅시작자가 다를 때
            map.put("divNo", divNo);
            map.put("userNo", user.getUserNo());
            map.put("getUserNo", getUser.getUserNo());
            List<Chat> chatList = chatService.selectChatListByMap(map);
            model.addAttribute("name", user.getUserName()).addAttribute("user", user);
            model.addAttribute("cList", chatList).addAttribute("getUser", getUser);
        }else{
            return "/";
        }
        model.addAttribute("uData", userData);
        return "chatting/list";
    }

}