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
				
				<div class="div2">
					<c:choose>
						<c:when test="${staffDto.staffGrade == '관리자'}">
							<input type="radio" name="staffGrade" value="관리자" checked> 관리자
						</c:when>
						<c:otherwise>
							<input type="radio" name="staffGrade" value="관리자"> 관리자
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${staffDto.staffGrade == '부장'}">
							<input type="radio" name="staffGrade" value="부장" checked> 부장
						</c:when>
						<c:otherwise>
							<input type="radio" name="staffGrade" value="부장"> 부장	
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${staffDto.staffGrade == '과장'}">
							<input type="radio" name="staffGrade" value="과장" checked> 과장
						</c:when>
						<c:otherwise>
							<input type="radio" name="staffGrade" value="과장"> 과장	
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${staffDto.staffGrade == '팀장'}">
							<input type="radio" name="staffGrade" value="팀장" checked> 팀장
						</c:when>
						<c:otherwise>
							<input type="radio" name="staffGrade" value="팀장"> 팀장	
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${staffDto.staffGrade == '사원'}">
							<input type="radio" name="staffGrade" value="사원" checked> 사원
						</c:when>
						<c:otherwise>
							<input type="radio" name="staffGrade" value="사원"> 사원	
						</c:otherwise>
					</c:choose>
				</div>
				
				<div class="div2">
					<c:choose>
						<c:when test="${staffDto.staffMedicalDepartment == '선택하지 않음'}">
							<input type="radio" name="staffMedicalDepartment" value="null" checked> 선택하지 않음
						</c:when>
						<c:otherwise>
							<input type="radio" name="staffMedicalDepartment" value="null"> 선택하지 않음
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${staffDto.staffMedicalDepartment == '내과'}">
							<input type="radio" name="staffMedicalDepartment" value="내과" checked> 내과
						</c:when>
						<c:otherwise>
							<input type="radio" name="staffMedicalDepartment" value="내과"> 내과	
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${staffDto.staffMedicalDepartment == '외과'}">
							<input type="radio" name="staffMedicalDepartment" value="외과" checked> 외과
						</c:when>
						<c:otherwise>
							<input type="radio" name="staffMedicalDepartment" value="외과"> 외과	
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${staffDto.staffMedicalDepartment == '정형외과'}">
							<input type="radio" name="staffMedicalDepartment" value="정형외과" checked> 정형외과
						</c:when>
						<c:otherwise>
							<input type="radio" name="staffMedicalDepartment" value="정형외과"> 정형외과	
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${staffDto.staffMedicalDepartment == '영상의학과'}">
							<input type="radio" name="staffMedicalDepartment" value="영상의학과" checked> 영상의학과
						</c:when>
						<c:otherwise>
							<input type="radio" name="staffMedicalDepartment" value="영상의학과"> 영상의학과	
						</c:otherwise>
					</c:choose>
				</div>
				
				<div class="div4">
					<button type="submit" class="change">변경</button>
				</div>
			
		</div>
	</form>
</body>
