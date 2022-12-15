<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<%-- 템플릿 페이지인 header.jsp를 동적으로 불러와라 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="메인페이지" name="title"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/calendar.jsp">
	<jsp:param value="달력" name="title"/>
</jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골든타임 병원</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link href="/resources/css/reset.css" rel="stylesheet">
<link href="/resources/css/commons.css" rel="stylesheet">
<link href="/resources/css/layout.css" rel="stylesheet">
<link href='fullcalendar/lib/main.css' rel='stylesheet' />
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src='fullcalendar/lib/main.js'></script>
<style>
 html, body{
            margin:0;
            padding:0;
        }

        main, header, aside, section, footer, nav, div {
            border:1px;
        }
        main {
            width: 800px;
            margin:0 auto;
        }
        header {
            padding: 20px;
        }
        nav {
            
        }
        aside {
            padding: 20px;
            float:left;
            width:25%;
            min-height: 400px;
        }
        section {
            padding: 20px;
            float:left;
            width:75%;
            min-height: 400px;
        }
        footer {
            padding: 20px;
        }
        
        .container{
        	position:relative;
			bottom:400px;
			left:0px;
			right:50px;
        }
        
        .myinfo{
        	position:absolute;
        	top:80%;
        	right:70%;
        	transform:translate(-10%,-80%);
        	border:black 1px solid;
        	      	
        }
        
        .notice{
        	position:absolute;
        	bottom:10%;
        	left:55%;
        	transform:translate(-10%,40%);
        	border:black 1px solid;
        }
        
        .attendance{
        	position:absolute;
        	bottom:10%;
        	left:20%;
        	transform:translate(-10%,-40%)
        	border:green1px solid;    	
        }
        
        .btn-start{
        	position: absolute;
        	bottom:10%;
        	left:20%;
        	width:30%;

        }
        
        .btn-finish{
   			position: absolute;
        	bottom:10%;
        	left:20%;
        	width:30%;
        }

</style>
</head>
<body>
    <!-- main은 영역의 시작과 끝을 의미 -->
    <main>


    </main>

<div class="container">

			<div class="row left myinfo">
				내정보
			<div>
				
			<!-- 프로필 이미지를 출력 --><!--  나중에 이미지 src 바꿔야됨-->
				<img class="img" src="./image/test.jpg" alt="테스트 사진" width="200" height="200">
			</div>	
			<div>김루피</div>
			<div>영상의학과</div>
			<div width="10%"><a href="staff/password">비밀번호 변경</a></div>
			<br>
			
		</div>
			
			</div>
			<div class="row left attendance">
			</div>
				<div>근태 관리 넣으실곳</div>
					<div class="row col-5">
						<div>출근시간</div> 
						&nbsp;
						&nbsp;
						<div>${attendance.startTime}</div>
						<button class="btn-start" type="button" >출근</button>
					</div>
					<div class="row col-5">
						<div>퇴근시간</div>
						&nbsp;
						&nbsp;
						<div>${attendance.endTime}</div>
						<button class="btn-finish" type="button">퇴근</button>
					</div>
			<div class="calendar" id="calendar">
		</div>
	
	
	<div class="notice text-center">
		<div>12월 01일 신짱구 환자 비염 수술 (CT요망)</div>
		
		<div>12월 02일 김둘리 환자 정형외과 수술 (CT요망)</div>
		
		<div>12월 04일 이기철 환자 비염 수술 (CT요망)</div>
	
		<div>12월 05일 이기영 환자 비염 수술 (CT요망)</div>
		
	</div>

</body>

</html>