package com.bringbring.chatting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.net.Socket;

@Controller
//@RequiredArgsConstructor
//@ServerEndpoint("/chatting")
@RequestMapping("/chatting")
public class ChatController extends Socket {
//    private static final List<Session> session = new ArrayList<>();

    @GetMapping("/list")
    public String index() {
        return "chatting/list";
    }

    @GetMapping("/{id}")
    public String chattingRoom(@PathVariable String id, HttpSession session, Model model){
        if(id.equals("guest")){
            model.addAttribute("name", "guest");
        }else if(id.equals("master")){
            model.addAttribute("name", "master");
        }else if(id.equals("loose")){
            model.addAttribute("name", "loose");
        }else{
            return "/";
        }
        return "chatting/test";
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