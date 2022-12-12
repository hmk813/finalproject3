package com.kh.goldentime.websocket;

import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.stereotype.Service;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

//웹소켓 서버생성
@Slf4j//로그 확인
@Service//DB를 사용
public class MessageWebsocketServer extends TextWebSocketHandler {
	
	//웹소켓 사용자 저장소
	private Set<WebSocketSession> users = new CopyOnWriteArraySet<>();//동기화
	
	//연결 수립된 이후에 실행된 메소드를 줌
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		users.add(session);//사용자 저장
		log.debug("사용자 접속 : {}", session);
	}
	
	//연결 종료 후
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		users.remove(session);
		log.debug("사용자 종료 : {}", session);
	}
	
	//text메세지를 받음
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.debug("메세지 수신 {}", message);
		
		//접속한 모든 사용자에게 전송
		for(WebSocketSession user : users) {
			user.sendMessage(message);
		}
	}
}
