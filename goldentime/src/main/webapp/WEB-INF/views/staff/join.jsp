<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="직원 생성" name="title"/>
</jsp:include>

<form action="join" method="post" enctype="multipart/form-data">
	<div class="container-700 mt-40 mb-40" style="margin: 20px">
		<div class="row center">
			<h1>직원 생성</h1>
		</div>
	
		<div class="row">
			<label>ID</label>
			<input class="input w-33" name="staffId" type="text" placeholder="아이디" required>
		</div>
			<br><br>
			
		<div class="row">
			<label>비밀번호</label>
			<input name="staffPw" type="password" required>
		</div>
			<br><br>
			
		<div class="row">
			<label>이름</label>
			<input name="staffName" type="text" required>
		</div>
			<br><br>
			
			부서 : 
			<select name="staffDepartmentNo" required>
				<!-- 반복문 -->
				<option value = "">선택</option>
				<c:forEach var = "selectDepartment" items = "${department}">
					<option value="${selectDepartment.departmentNo}">${selectDepartment.departmentName}</option>
				</c:forEach>
			</select>
			<br><br>
		
			생년월일 : <input name="staffBirth" type="date" required> <br><br>
			
			입사일 : <input name="staffEnrollDate" type="date" required><br><br>
			
			<div class="row left mt-30">직급</div>
			<div>
				<input type="radio" name="staffGrade" value="관리자"> 관리자
				<input type="radio" name="staffGrade" value="부장"> 부장
				<input type="radio" name="staffGrade" value="과장"> 과장
				<input type="radio" name="staffGrade" value="팀장"> 팀장
				<input type="radio" name="staffGrade" value="사원"> 사원
			</div>
			
			전화번호 : <input name="staffPhone" type="tel"> <br><br>
			
			주소 : <input name ="staffAddress" type="text"><br><br>
			
			<div class="row left mt-30">진료과</div>
			<div>
				<input type="radio" name="staffMedicalDepartment" value=null> 선택하지 않음
				<input type="radio" name="staffMedicalDepartment" value="내과"> 내과
				<input type="radio" name="staffMedicalDepartment" value="외과"> 외과
				<input type="radio" name="staffMedicalDepartment" value="정형외과"> 정형외과
				<input type="radio" name="staffMedicalDepartment" value="영상의학과"> 영상의학과
			</div>
			<br>
			
			직원이미지 : 
			<input type="file" name="staffImg" accept=".png, .jpg" multiple="multiple">
			<br><br>
			
			<button type="submit">생성하기</button>
			
	</div>
</form>

<!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script>
    	$(function(){
    		
    	}
    </script>

