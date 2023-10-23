package com.bringbring.chatting.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatMessageDTO {

    private int chatroomNo;
    private int userNo;
    private String writer;
    private String message;
}