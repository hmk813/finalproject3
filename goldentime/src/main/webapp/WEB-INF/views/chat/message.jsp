<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>메세지 전송 예제</h1>
<button class="btn-connect">연결</button>
<button class="btn-disconnect">종료</button>
<hr>
<input type="text" id="message-input">
<button type="button" id="message-send">전송</button>
<hr>
<div id="message-list"></div>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	$(function(){
		
		disconnectState();//처음에 연결이 안되어있는 상태
		
		//연결버튼을 누르면 웹소켓 연결을 생성
		$(".btn-connect").click(function(){//btn-connect 버튼을 클릭하게 되면
			
			//웹소켓 연결 생성
			var uri = "ws://localhost:8888/ws/message";//웹소켓 연결주소 생성
			
			//어디서든 접근하기 위해 윈도우에 생성
			socket = new WebSocket(uri);
			
			// 웹소켓 객체가 기본 제공하는 4가지 이벤트를 설정해서 처리
			// 코드를 쓰기위한 함수생성
			socket.onopen = function(){//웹소켓 생성
				connectState();//연결이 된 상태
			};
			socket.onclose = function(){//웹소켓 종료
				disconnectState();//연결이 종료된 상태
			};
			socket.onerror = function(){//웹소켓 에러
				disconnectState();//에러로 연결이 안된 상태
			};
			socket.onmessage = function(e){//웹소켓에서 전송된 e이벤트 정보를(메세지) 받으면
				$("<p>").text(e.data).appendTo("#message-list");//p태그 생성 후 text에 e.data를 넣고 message-list라는 id를 가진 영역에 첨부 
			};
			
		});
		
		//종료버튼을 누르면 웹소켓 연결을 제거
		$(".btn-disconnect").click(function(){//btn-disconnect 버튼을 클릭하게 되면
			
			//웹소켓 연결 종료
			socket.close();//윈도우
			
		});
		
		//전송버튼을 누르면 웹소켓으로 입력된 메세지를 전송
		$("#message-send").click(function(){//message-send 버튼을 클릭하게 되면
			var text = $("#message-input").val();//input에 입력된 text값을 가져옴
			if(text.length == 0) return;//입력된 text값이 없다면 하지 않음
			
			socket.send(text);//윈도우
			
			$("#message-input").val("");//입력값을 비워줌(중복 재전송 방지)
		});
		
		function connectState(){//연결상태일 때
			$(".btn-connect").prop("disabled", true);//연결버튼 잠금
			$(".btn-disconnect").prop("disabled", false);//종료버튼 해제
		}
		function disconnectState(){//종료상태일 때
			$(".btn-connect").prop("disabled", false);//연결버튼 해제
			$(".btn-disconnect").prop("disabled", true);//종료버튼 잠금
		}
	});
</script>