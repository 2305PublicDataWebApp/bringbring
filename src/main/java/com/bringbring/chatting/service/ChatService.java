package com.bringbring.chatting.service;

import com.bringbring.chatting.domain.Chat;
import com.bringbring.chatting.domain.ChatRoom;

import java.util.List;
import java.util.Map;

public interface ChatService {
    int insertChat(Chat chat);
    List<Chat> selectChatListByMap(Map<String, Object> map);

    ChatRoom selectChatRoom(Map<String, Object> chatRoomMap);

    int insertChatRoom(Map<String, Object> chatRoomMap);

    List<Chat> selectChatRoomListByNo(int chatroomNo);

    int updateDivYn(int chatroomNo);
}
