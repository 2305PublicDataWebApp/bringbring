package com.bringbring.chatting.service;

import com.bringbring.chatting.domain.Chat;

import java.util.List;
import java.util.Map;

public interface ChatService {
    int insertChat(Chat chat);
    List<Chat> selectChatListByMap(Map<String, Object> map);
}
