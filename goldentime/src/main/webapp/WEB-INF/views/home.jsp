<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- 템플릿 페이지인 header.jsp를 동적으로 불러와라 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="메인페이지" name="title"/>
</jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골든타임 병원</title>
<script></script>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link href="/resources/css/home.css" rel="stylesheet">
<link href="/resources/css/reset.css" rel="stylesheet">
<link href='fullcalendar/lib/main.css' rel='stylesheet' />
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src='fullcalendar/lib/main.js'></script>

	<style>
    </style>

</head>
<body>
<div class="row center">
<tbody>
	<div class="container fluid">
		<div class="c-left">
			<div class="row left">
				<span class="c-title">내 정보</span>
					<div>
					<br>
					<a href="staff/password">비밀번호 변경</a><br><br>
					<a href="staff/information">개인정보 변경</a>
					
					
					
					<br><br>
					진료과
					<br>
					내과
					<br>
					외과
					<br>
					정형외과
					<br>
					영상의학과
					<br>
					원무과
					<br>
					물품신청
					<br>
					마이페이지
					<br>
					메세지
					
					
					
					
					<span class="material-icons" style="font-size: 80px;display: block;text-align: center">					
							내정보
	<table border="1" width="400" align="center">		
			<!-- 프로필 이미지를 출력 -->
				<img class="img" src="./image/test.jpg" alt="테스트 사진" width="100" height="100">
			</div>	
			<tr>
				<th width="25%">이름</th>
				<td>${staffDto.staffName}</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>${staffDto.staffBirth}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${staffDto.staffPhone}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${staffDto.staffAddress}</td>
			</tr>
			<tr>
				<th>등급</th>
				<td>
					${staffDto.staffGrade}
				</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>
					<fmt:formatDate value="${staffDto.staffEnrollDate}" pattern="y년 M월 d일 E a h시 m분 s초"/>
				</td>
			</tr>
			<tr>
				<th>퇴사일</th>
				<td>
					<fmt:formatDate value="${staffDto.staffLeaveDate}" pattern="y년 M월 d일 E a h시 m분 s초"/>
				</td>
			</tr>
		</tbody>
	</table>
			</span>
		</div>
				<div class="info-list">
				</div>
			
			</div>
			<div class="attendance box">
				<span class="c-title">근태 관리</span>
				<div class="att-time">
					<div>
						출근 시간<span id="att-str"></span>
					</div>
					<div>
						퇴근 시간<span id="att-fin"></span>
					</div>
				</div>
				<div class="att-btn">
					<button id="attStr-btn">출근</button>
					<button id="attFin-btn">퇴근</button>
				</div>
			</div>
		</div>
		<div class="c-center">
			<div class="calendar" id="calendar">
			</div>
			<div class="calendar-detail box-t">
				<header id="cal-header"></header>
				<div class="cal-area">
					<table id="cal-table"></table>
				</div>
			</div>
		</div>
			<div class="notice box">
				<span class="c-title">공지사항</span>
			</div>
</tbody>			
</div>			
		
</body>
</html>