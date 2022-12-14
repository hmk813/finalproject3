package com.kh.goldentime.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.kh.goldentime.websocket.MessageWebsocketServer;

//웹소켓 서버 등록
@Configuration//역할등록
@EnableWebSocket//웹소켓 활성화
public class WebSocketServerConfiguration implements WebSocketConfigurer {
	
	//서버등록을 위한 의존성
	@Autowired
	private MessageWebsocketServer messageUserWebsocketServer;
	
	//registry에 만든 웹소켓 서버를 등록
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		//basicWebsocketServer를 registry에 등록
		registry.addHandler(messageUserWebsocketServer, "/ws/message");//소켓 연결을 위한 주소
	}
}
