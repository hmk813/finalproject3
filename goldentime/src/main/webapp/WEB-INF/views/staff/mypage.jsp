<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="마이페이지" name="title"/>
</jsp:include>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<%-- 관리자 메뉴일 경우와 아닐 경우 다른 헤더를 설정 --%>
<%--  <c:choose>
	<c:when test="${mg == '관리자'}">
		<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
			<jsp:param value="${staffDto.staffId} 관리자 정보" name="title"/>
		</jsp:include>
	</c:when>
	<c:otherwise>
		<jsp:include page="/WEB-INF/views/template/header.jsp">
			<jsp:param value="${staffDto.staffId} 사원 정보" name="title"/>
		</jsp:include>
	</c:otherwise>
</c:choose> 헤더 ,푸터 만들면 주석 풀기--%>   
   <div align="right">	<h2><a href="/"><i class="fa-solid fa-arrow-right-from-bracket"></i></a></h2></div>
<div align="left">
	<h1>사원 정보</h1>
	<table border="1" width="350" height="300">
		<tbody>
			<!-- 프로필 이미지를 출력 -->
			<tr>
				<th colspan="2">
				<div style="text-align:left" class="image-box">
				 <img class="img-thumbnail"  src="../image/test.jpg" alt="테스트 사진"  width="150" height="150">
				</div>
				</th>
			</tr>
		
			<tr>
				<th>이름</th>
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

	<table border="1" width="350" height="300">
		<tbody> 
			<tr>
			<th>근태관리</th>
			<td>출근</td>
			<td>퇴근</td>
			</tr>
		</tbody>
	</table>

	<form action="/upload" method="post" enctype="multipart/form-data">
		<input type="file" name="attachment"><br><br>
		<button type="submit">등록</button>
	
	</form>	
	
	<c:choose>
		<c:when test="${staffGrade == '관리자'}">
			<!-- 관리자용 메뉴 -->
			<h2><a href="list">목록 보기</a></h2>
			<h2><a href="change?staffId=${staffDto.staffId}">정보 변경</a></h2>
			<h2><a href="/">로그아웃</a></h2>
		</c:when>
	<c:otherwise>
		
			<h2><a href="password">비밀번호 변경</a></h2>
			<h2><a href="information">개인정보 변경</a></h2>

		</c:otherwise>
	</c:choose>
	
	
</div>


