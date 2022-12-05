<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<form action="login" method="post">
<div class="container-700">

	<div class="row center">
		<h1>직원 메뉴</h1>
	</div>
	<div class="row center">
		<input class="input_underline" type="text" name="memberId" placeholder="아이디" required autocomplete="off">
	</div>
	<div class="row center">
		<input class="input_underline" type="password" name="memberPw" placeholder="비밀번호" required autocomplete="off">
	</div>
	<div class="row center">
		<button class="btn btn-neutral" type="submit" name="login">로그인</button>
	</div>
	<div class="row center">
	<c:if test="${param.error == null}">
		<h1>마이페이지</h1>
	</c:if>
	</div>
	<div class="row center">
	<c:if test="${param.error != null}">
		<h2 style="color:red">로그인 실패</h2>
	</c:if>
	</div>
</div>
</form>