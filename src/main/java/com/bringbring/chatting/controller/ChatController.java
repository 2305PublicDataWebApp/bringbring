package com.bringbring.chatting.controller;

import com.bringbring.chatting.domain.UserData;
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

@Controller
@RequiredArgsConstructor
//@ServerEndpoint("/chatting")
@RequestMapping("/chatting")
public class ChatController extends Socket {
//    private static final List<Session> session = new ArrayList<>();

    private final DivideService divideService;
    private final UserService userService;


    @GetMapping("/{id}")
    public String chattingRoom(@PathVariable String id
            , HttpSession session
            , Model model
            , int divNo){

        UserData userData = divideService.selectUserDataByNo(divNo);
        String userId = (String)session.getAttribute("sessionId");
        if(id.equals(userId)){
            User user = userService.selectOneById(userId);
            model.addAttribute("name", user.getUserName()).addAttribute("user", user);

        }else if(id.equals("master")){
            model.addAttribute("name", "master");
        }else if(id.equals("loose")){
            model.addAttribute("name", "loose");
        }else{
            return "/";
        }
        model.addAttribute("uData", userData);
        return "chatting/list";
    }
//    @OnOpen
//    public void open(Session newUser) {
//        System.out.println("connected");
//        session.add(newUser);
//        System.out.println(newUser.getId());
//    }

//    @OnMessage
//    public void getMsg(Session recieveSession, String msg) {
//        for (int i = 0; i < session.size(); i++) {
//            if (!recieveSession.getId().equals(session.get(i).getId())) {
//                try {
//                    session.get(i).getBasicRemote().sendText("상대 : "+msg);
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }
//            }else{
//                try {
//                    session.get(i).getBasicRemote().sendText("나 : "+msg);
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }
//            }
//        }
//    }
}