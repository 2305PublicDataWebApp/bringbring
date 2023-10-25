package com.bringbring.chatting.domain;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ChatRoom {

	private int chatroomNo;
	private int divNo;
	private int userNo;
	private int getUserNo;
	private LocalDateTime chatroomCreateDate;
	private char chatDivYn;

	private int chatroomCount;
	private int mUserNo;

}
