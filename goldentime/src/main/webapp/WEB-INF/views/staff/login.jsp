<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body class="bg-primary">

	<div class="card-header">
		<h3 class="text-center font-weight-light my-4">Login</h3>
	</div>
	
	<div class="card-body">
	
	<form class="login-form" action="login" method="post" autocomplete="off">
		<div class="row center">
			<input class="input_underline" type="text" name="staffId"  id="staffId"required placeholder="Id" autocomplete="off"><br>
		</div>
		
		<br>
		
		<div class="row center">
			<input class="input_underline" type="password" name="staffPw" required placeholder="Password" autocomplete="off">
		</div>
		
		<c:if test="${param.error != null}">
			<div class="row mt-4">
				<span style="color:red;">아이디 / 비밀번호를 잘못 입력했습니다.</span>
			</div>
		</c:if>
		
		<div class="d-flex align-items-center justify-content-between mt-4 mb-0">
			<button class="btn btn-primary" type="submit">GoldenTime 로그인</button>
		</div>
	</form>
	</div>

</body>
	
