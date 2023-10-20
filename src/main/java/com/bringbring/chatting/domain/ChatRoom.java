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

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ChatRoom {
     String id;
     Set<WebSocketSession> sessions = new HashSet<>();

	public ChatRoom(String room_id) { this.id = room_id; }

	public void handleMessage(WebSocketSession session, Chat chat, ObjectMapper objectMapper) throws JsonProcessingException {
        if (chat.getChatNo() > 0)
            join(session); 
        else
        	send(chat, objectMapper);
    }

    private void join(WebSocketSession session) {
        sessions.add(session);
    }
    
    private <T> void send(T messageObject, ObjectMapper objectMapper) throws JsonProcessingException {
        TextMessage message = new TextMessage(objectMapper.writeValueAsString(messageObject));
  
        sessions.parallelStream().forEach(session -> {
			try {
				session.sendMessage(message);
			} catch (IOException e) {
				e.printStackTrace();
			}
		});
    }
    
	public void remove(WebSocketSession target) {
	  String targetId = target.getId();
	  sessions.removeIf(session -> session.getId().equals(targetId));
	 }

	public String getId() {
		return id;
	}

	public Set<WebSocketSession> getSessions() {
		return sessions;
	}
 
}
