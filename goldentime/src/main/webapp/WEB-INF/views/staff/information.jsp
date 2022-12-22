<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
	<jsp:param value="내 정보 변경" name="title"/>
</jsp:include>

<style>
	h4{
		text-align: center;
		margin-top: 10px;
	}
	.div1, .div2, .div3, .div4 {
		text-align: center;
		margin-top: 10px;
	}
	.sp1 {
		font-size: 20px;
		font-weight: 700;
		color: #3f3f3f;
	}
	.input {
		border: 1px solid #4e73df;
		border-radius: 0.7em;
		width: 250px;
		height:30px;
	}
	.change {
		border: 2px solid #4e73df;
		border-radius: 0.7em;
		background-color: #4e73df;
		color: #FFF;
		width: 250px;
		height:30px;
	}
</style>

<body>
	<form action="information" method="post">
	<input type="hidden" name="staffId" value="${staffDto.staffId}">
		<div>
			<div class="div1">
				<span class="sp1">직원 정보 변경</span>
			</div>
			
				<div class="div2">
					<input class="input" type="text" name="staffId" required value="${staffDto.staffId}" autocomplete="off" readonly placeholder="아이디" >
				</div>
				<div class="div2">
					<input class="input" type="tel" name="staffPhone" value="${staffDto.staffPhone}" autocomplete="off" placeholder="전화번호">
				</div>
				<div class="div2">
					<input class="input" type="text" name="staffAddress"  value="${staffDto.staffAddress}" autocomplete="off" placeholder="주소">
				</div>
				<div class="div3">
					<input class="input" type="password" name="staffPw" required placeholder="비밀번호 확인">
				</div>
				<div class="div4">
					<button type="submit" class="change">변경</button>
				</div>
			
			<c:if test="${param.error != null}">
				<h4 style="color:red">비밀번호가 맞지 않습니다.</h4>
			</c:if>
		</div>
	</form>
</body>
