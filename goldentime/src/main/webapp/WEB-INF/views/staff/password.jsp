<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="비밀번호 변경" name="title"/>
</jsp:include>

	<style>
	.div1, .div2, .div3, .div4{
	text-align: center;
	margin-top: 10px;
	}
	.sp1{
		font-size: 20px;
		font-weight: 700;
		color: #3f3f3f;
	}
	.pw-input{
	border: 1px solid #4e73df;
	border-radius: 0.7em;
	width: 250px;
	height:30px;
	}
	.rePw-input{
	border: 1px solid #4e73df;
	border-radius: 0.7em;
	width: 250px;
	height:30px;
	}
	.change-pw{
	border: 2px solid #4e73df;
	border-radius: 0.7em;
	background-color: #4e73df;
	color: #FFF;
	width: 250px;
	height:30px;
	}
	</style>
<body>
	<div>
		<div class="div1">
			<span class="sp1">비밀번호 변경</span>
		</div>
		
		<form action="password" method="get">
			<div class="div2">
				<input type="password" name="beforepw" placeholder="기존 비밀번호" class="pw-input">
			</div>
			<div class="div3">
				<input type="password" name="afterpw" placeholder="변경할 비밀번호" class="rePw-input">
			</div>
			<div class="div4">
				<button type="submit" class="change-pw">변경</button>
			</div>
		</form>
		
		<c:if test="${param.error != null }">
			<p>비밀번호가 맞지 않습니다. </p>
		</c:if>
	</div>
</body>
	<%-- <h1>비밀번호 변경</h1>
	<h2 align="center">비밀번호 변경</h2>

		<form action="password" method="post">

		<input type="password" name ="beforePw" placeholder="기존 비밀번호">
		<input type="password" name ="afterPw" placeholder="바꿀 비밀번호">
		<button type="submit">변경</button> 
	
	</form>
	
	<c:if test="${param.error != null}">
	<h2 style="color:red">비밀번호가 잘못 작성되었습니다</h2>
	</c:if>
 --%>

