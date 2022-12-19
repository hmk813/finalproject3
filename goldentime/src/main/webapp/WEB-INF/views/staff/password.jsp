<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="비밀번호 변경" name="title"/>
</jsp:include>

	<h2 align="center">비밀번호 변경</h2>

	<form action="password" method="post" align="center">
		
		<input type="password" name ="beforePw" placeholder="기존 비밀번호">
		<br><br> 
		<input type="password" name ="afterPw" placeholder="바꿀 비밀번호">
		<br><br>
		<button type="submit">변경</button> 
	
	</form>
	
	<c:if test="${param.error != null}">
	<h2 style="color:red">비밀번호가 잘못 작성되었습니다</h2>
	</c:if>



