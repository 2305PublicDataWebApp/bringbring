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
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ChatRoom {
	private String roomId;
	private String name;
	private Set<WebSocketSession> sessions = new HashSet<>();
	//WebSocketSession은 Spring에서 Websocket Connection이 맺어진 세션

	public static ChatRoom create(String name){
		ChatRoom room = new ChatRoom();

		room.roomId = UUID.randomUUID().toString();
		room.name = name;
		return room;
	}
}
