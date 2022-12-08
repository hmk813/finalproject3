<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="내 정보 변경" name="title"/>
</jsp:include>


<form action="information" method="post">
<div class="container-700">

<div class="row center">
	<h1>내 정보 변경</h1>
</div>
<div class="row center">
  <input class="input w-100" type="text" name="staffId" required value="${staffDto.staffId}" placeholder="아이디"autocomplete="off" readonly>
</div>
	
	<input type="tel" name="staffPhone" value="${staffDto.staffPhone}" autocomplete="off"><br><br>
	<input type="text" name="staffAddress"  value="${staffDto.staffAddress}" autocomplete="off"><br><br>
	
	비밀번호 확인 : <input type="password" name="staffPw" required><br><br>
	<button type="submit">변경하기</button>

<c:if test="${param.error != null}">
	<h2 style="color:red">비밀번호가 맞지 않습니다</h2>
</c:if>


</div>
</form>





