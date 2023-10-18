package com.bringbring.chatting.service.impl;

import com.bringbring.chatting.domain.Chat;
import com.bringbring.chatting.service.ChatService;
import com.bringbring.chatting.store.ChatStore;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional
@RequiredArgsConstructor
public class ChatServiceImpl implements ChatService {

    private final ChatStore chatStore;

    @Override
    public int insertChat(Chat chat) { return chatStore.insertChat(chat);  }

    @Override
    public List<Chat> selectChatListByMap(Map<String, Object> map) { return chatStore.selectChatListByMap(map); }
}
