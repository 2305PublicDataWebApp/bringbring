package com.bringbring.chatting.controller;

import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.logging.Logger;

@Component
public class ChatHandler extends TextWebSocketHandler {

//    private static LinkedHashSet<WebSocketSession> numSet = new LinkedHashSet<>();

    public final static List<WebSocketSession> sessionList = Collections.synchronizedList(new ArrayList<WebSocketSession>());
    SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    Logger logger = Logger.getLogger(String.valueOf(this.getClass()));
    @Override
    public void afterConnectionEstablished(WebSocketSession webSocketSession) throws Exception {
        System.out.println("Connection established..."+webSocketSession.getRemoteAddress());
        System.out.println(webSocketSession.getAttributes().get("user")+" Login");
        webSocketSession.sendMessage(new TextMessage("I'm "+(webSocketSession.getAttributes().get("user"))));
        sessionList.add(webSocketSession);
    }

    @Override
    public void afterConnectionClosed(WebSocketSession webSocketSession, CloseStatus status) throws Exception {
        System.out.println("Connection closed..."+webSocketSession.getRemoteAddress()+" "+status);
        System.out.println(webSocketSession.getAttributes().get("user")+" Logout");
        sessionList.remove(webSocketSession);
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

        for (WebSocketSession sess : sessionList) {
            sess.sendMessage(message);
        }
    }

//    @Override
//    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//        if(numSet.size()>=3){
//            WebSocketSession oldSession = numSet.iterator().next();
//            oldSession.sendMessage(new TextMessage("채팅이 종료되었습니다."));
//            numSet.remove(numSet.iterator().next());
//        }
//
//        boolean isSessionAlive = false;
//
//        for(WebSocketSession sess: numSet) {
//            if(sess.getId().equals(session.getId())){
//                isSessionAlive = true;
//            }
//        }
//        if(isSessionAlive){
//            for(WebSocketSession sess: numSet) {
//                sess.sendMessage(message);
//            }
//        }
//    }

//    @Override
//    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//        numSet.add(session);
//    }
//
//    @Override
//    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
//        numSet.remove(session);
//    }
}