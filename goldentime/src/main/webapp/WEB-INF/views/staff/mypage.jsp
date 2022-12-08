<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="마이페이지" name="title"/>
</jsp:include>

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
   
<div align="center">
	<h1>사원 정보</h1>
	<table border="1" width="400">
		<tbody>
			<!-- 프로필 이미지를 출력 -->
			<tr>
				<th colspan="2">
				<div style="text-align:center">
				 <img class="img-thumbnail"  src="./image/test.jpg" alt="테스트 사진"  width="100" height="100">
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
	
	<c:choose>
		<c:when test="${GRADE == '관리자'}">
			<!-- 관리자용 메뉴 -->
			<h2><a href="list">목록 보기</a></h2>
			<h2><a href="change?memberId=${staffDto.staffId}">정보 변경</a></h2>
			<h2><a href="exit?memberId=${staffDto.staffId}">회원 탈퇴</a></h2>
		</c:when>
		<c:otherwise>
		
			<!-- 사원용 메뉴 -->
			<h2><a href="password">비밀번호 변경</a></h2>
			<h2><a href="information">개인정보 변경</a></h2>
		</c:otherwise>
	</c:choose>
	
	
</div>


