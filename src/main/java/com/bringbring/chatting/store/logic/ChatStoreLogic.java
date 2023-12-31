package com.bringbring.chatting.store.logic;

import com.bringbring.chatting.domain.Chat;
import com.bringbring.chatting.domain.ChatRoom;
import com.bringbring.chatting.store.ChatStore;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class ChatStoreLogic implements ChatStore {

    private final SqlSession sqlSession;

    @Override
    public int insertChat(Chat chat) { return sqlSession.insert("ChatMapper.insertChat", chat); }

    @Override
    public List<Chat> selectChatListByMap(Map<String, Object> map) { return sqlSession.selectList("ChatMapper.selectChatListByMap", map); }

    @Override
    public ChatRoom selectChatRoom(Map<String, Object> chatRoomMap) { return sqlSession.selectOne("ChatMapper.selectChatRoom", chatRoomMap); }

    @Override
    public int insertChatRoom(Map<String, Object> chatRoomMap) { return sqlSession.insert("ChatMapper.insertChatRoom", chatRoomMap); }

    @Override
    public List<Chat> selectChatRoomListByNo(int chatroomNo) { return sqlSession.selectList("ChatMapper.selectChatRoomListByNo", chatroomNo); }

    @Override
    public int updateDivYn(int chatroomNo) { return sqlSession.update("ChatMapper.updateDivYn", chatroomNo); }
}
