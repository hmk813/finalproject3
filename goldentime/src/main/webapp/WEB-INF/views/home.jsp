<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- 템플릿 페이지인 header.jsp를 동적으로 불러와라 --%>
<jsp:include page="/WEB-INF/views/template/menuBar.jsp">
	<jsp:param value="메인페이지" name="title"/>
</jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골든타임 병원</title>
<script></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link href="/resources/css/home-style.css" rel="stylesheet">
<link href="/resources/css/reset.css" rel="stylesheet">
<link href='fullcalendar/lib/main.css' rel='stylesheet' />
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src='fullcalendar/lib/main.js'></script>
</head>
<body>

<div class="container">
		<div class="c-left">
			<div class="myInfo box">
				<span class="myInfo">내 정보</span>
					 <img class="img-thumbnail"  src="../image/test.jpg" alt="테스트 사진"  width="150" height="150">
				<c:if test="${loginUser.photo == null }">
				</c:if>
				<div style="font-size:18px;">${loginUser.memberName } ${loginUser.rank }</div>
				<div style="color: rgba(90, 90, 90); font-size:16px">${loginUser.division }</div>
		
</body>



</html>