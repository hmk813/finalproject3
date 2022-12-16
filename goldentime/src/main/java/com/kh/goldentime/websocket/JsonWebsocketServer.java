package com.kh.goldentime.websocket;

import java.util.Date;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.stereotype.Service;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.goldentime.vo.MessageVO;

import lombok.extern.slf4j.Slf4j;

//웹소켓 서버생성
@Slf4j//로그 확인
@Service//DB를 사용
public class JsonWebsocketServer extends TextWebSocketHandler {
	
	//웹소켓 다중사용자 저장소
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
		log.debug("메세지 - {}", message.getPayload());//메세지에 시간을 넣기 위해 Payload
		
		//변환 도구 mapper 생성
		ObjectMapper mapper = new ObjectMapper();
		
		MessageVO json = mapper.readValue(message.getPayload(), MessageVO.class);//message.getPayload를 문자열로 클래스읽기
		log.debug("json = {}", json);
		
		json.setTime(new Date());//json에 시간 추가
		
		//json을 보내기 위해 바뀐 정보를 이용한 신규 메세지 생성
		//json을 이용해 payload를 만들고 payload에 넣는다.
		String payload = mapper.writeValueAsString(json);
		TextMessage jsonMessage = new TextMessage(payload);//핵심이 되는 문자열을 보내는 데이터 = payload에 json(문자열)이 들어가야함
		
		//접속한 모든 사용자에게 전송
		for(WebSocketSession user : users) {
			user.sendMessage(jsonMessage);
		}
	}
}
