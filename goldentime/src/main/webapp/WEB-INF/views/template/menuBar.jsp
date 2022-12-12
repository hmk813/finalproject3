<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menubar</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Changa:wght@400&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<body>
    <div class="menu">
        <!-- <p class="share">Golden   로고 들어갈 위치
        <p class="ware">Time  -->
        <div class="list-item ${myCondition eq 'home' ? 'active' : ''}"><a href="/">홈</a></div>
        <div class="list-item ${myCondition eq 'attendance' ? 'active' : ''}"><a href="/attendance/list">근태 관리</a></div>
        <div class="list-item ${myCondition eq '진료과' ? 'active' : ''}"><a href="/">진료과</a></div>
        <div class="list-item ${myCondition eq '원무과' ? 'active' : ''}"><a href="/">원무과</a></div>
        <div class="list-item ${myCondition eq '물품신청' ? 'active' : ''}"><a href="/">물품신청</a></div>
        <div class="list-item ${myCondition eq '메세지' ? 'active' : ''}"><a href="/">메세지</a></div>
        
    </div>
    <div class="header">
			<button id="btn-info">
				<c:if test="${loginUser.photo != null }">
				<img class="img-thumbnail"  src="../image/test.jpg" alt="테스트 사진"  width="150" height="150">
				</c:if>
				<c:if test="${loginUser.photo == null }">
					<span class="material-icons" style="font-size:45px;">
						account_circle
					</span>
				</c:if>
				<span class="staff">${staffId.staffName} 님</span>
			</button>
		</div>
    <div id="profile-menu">
    	<button onclick="location.href='/staff/mypage'">기본정보조회</button>
    	<button onclick="location.href='/staff/login'">로그아웃</button>
    </div>
</body>
<script>
	
	// 프로필 메뉴
	$("#btn-info").click(function() {
		if($("#profile-menu").css("display") === "none" ) {
			$("#profile-menu").show();
		}else {
			$("#profile-menu").hide();
		}
	})
	
</script>
</html>