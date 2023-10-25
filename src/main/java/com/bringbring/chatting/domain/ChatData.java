package com.bringbring.chatting.domain;

import com.bringbring.divide.domain.Divide;
import com.bringbring.user.domain.User;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ChatData {

    private Chat chat;
    private User user;
    private Divide divide;
    private ChatRoom chatRoom;
}
