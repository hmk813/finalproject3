package com.kh.goldentime.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@GetMapping("/message")//WebSocketServerConfiguration에서 서버 등록한 주소와 동일한 이름
	public String basic() {
		return "chat/message";
	}
}
