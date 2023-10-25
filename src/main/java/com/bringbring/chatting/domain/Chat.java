package com.bringbring.chatting.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Chat {

    private int chatNo;
    private int divNo;
    private int userNo;
    private int getUserNo;
    private String chatContent;
    private LocalDateTime chatCreateDate;
    private char isChatDeleted;
    private int chatRoomNo;

}
