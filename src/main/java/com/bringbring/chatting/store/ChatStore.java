package com.bringbring.chatting.store;

import com.bringbring.chatting.domain.Chat;

import java.util.List;
import java.util.Map;

public interface ChatStore {
    int insertChat(Chat chat);

    List<Chat> selectChatListByMap(Map<String, Object> map);
}
