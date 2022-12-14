<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>메세지 전송</h1>

<!-- 상태 판정 출력 -->
<h2>아이디 : ${loginId}</h2>
<h2>이름 : ${loginName}</h2><!-- session.setAttribute("loginName", findDto.getStaffName()); -->
<h2>직위 : ${loginGrade}</h2>

<button class="btn-connect">연결</button>
<button class="btn-disconnect">종료</button>
<hr>
<input type="text" id="message-input">
<button type="button" id="message-send">전송</button>
<hr>
<div id="message-list"></div>

<!-- moment cdn추가 => 시간을 원하는 형식으로 변환 -->
<!-- sockjs cdn추가 => 주소를 HTTP로 설정 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	$(function(){
		
		disconnectState();//처음에 연결이 안되어있는 상태
		
		//연결버튼을 누르면 웹소켓 연결을 생성
		$(".btn-connect").click(function(){//btn-connect 버튼을 클릭하게 되면
			
			//웹소켓 연결 생성
			var uri = "${pageContext.request.contextPath}/ws/sockjs";//웹소켓 연결주소 생성(절대경로로 표시)
			
			//어디서든 접근하기 위해 윈도우에 생성(접속시 생성하는 객체는 SockJS)
			socket = new SockJS(uri);
			
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
				
				//수신된 e.data는 JSON문자열이라 문자열을 객체로 변환
				var data = JSON.parse(e.data);
			
				var p = $("<p>").text(data.text);//data.text는 p태그에 넣고
				var time = moment(data.time).format("YYYY-MM-DD hh:mm");//data.time은 moment로 변환
				var span = $("<span>").text("("+time+")");//<span>으로 출력
				p.append(span);
				$("#message-list").append(p);//message-list라는 id를 가진 영역에 첨부 
			};
			
		});
		
		//종료버튼을 누르면 웹소켓 연결을 제거
		$(".btn-disconnect").click(function(){//btn-disconnect 버튼을 클릭하게 되면
			
			//웹소켓 연결 종료
			socket.close();//윈도우
			
		});
		
		//전송버튼을 누르면 웹소켓으로 입력된 메세지를 전송
		$("#message-send").click(function(){//message-send 버튼을 클릭하게 되면
			var text = $("#message-input").val();//input에 입력된 text 내용값을 가져옴
			if(text.length == 0) return;//입력된 text값이 없다면 하지 않음
			
			var data = {
					text : text//이름 : 내용
			};
			socket.send(JSON.stringify(data))//통신은 문자열만 전송가능해서 객체를 문자열로 변환
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