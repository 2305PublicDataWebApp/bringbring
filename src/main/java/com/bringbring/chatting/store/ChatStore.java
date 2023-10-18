package com.bringbring.chatting.store;

import com.bringbring.chatting.domain.Chat;

public interface ChatStore {
    int insertChat(Chat chat);
}
