<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="./css/reset.css">
<link rel="stylesheet" type="text/css" href="./css/commons.css">


<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="로그인" name="title"/>
</jsp:include>

<form action="login" method="post">
<div class="container-700">

	<div class="row center">
		<h1>직원 로그인</h1>
	</div>
	<div class="row center">
		<input class="input_underline" type="text" name="staffId" placeholder="아이디" required autocomplete="off">
	</div>
	<div class="row center">
		<input class="input_underline" type="password" name="staffPw" placeholder="비밀번호" required autocomplete="off">
	</div>
	<div class="row center">
		<button class="btn btn-neutral" type="submit" name="login">로그인</button>
	</div>
</div>
</form>