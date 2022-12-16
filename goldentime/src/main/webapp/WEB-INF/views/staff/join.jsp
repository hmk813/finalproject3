<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="직원 생성" name="title"/>
</jsp:include>

<h1>직원 생성 페이지</h1>
<form action="join" method="post" enctype="multipart/form-data">

	ID : <input name="staffId" type="text" required> <br><br>
	
	비밀번호 : <input name="staffPw" type="password" required><br><br>
	
	이름 : <input name="staffName" type="text" required><br><br>
	
	부서번호 : 
	<select name="staffDepartmentNo" required>
		<option value = "1">의사</option>
		<option value = "2">간호사</option>
		<option value = "3">원무과</option>
		<option value = "4">병원장</option>
	</select><br><br>
	<!-- 
	<input name="staffDepartmentNo" type="number" required><br><br>
	 -->
	생년월일 : <input name="staffBirth" type="date" required> <br><br>
	
	입사일 : <input name="staffEnrollDate" type="date" required><br><br>
	
	등급 : <input name="staffGrade" type="text" required><br><br>
	
	전화번호 : <input name="staffPhone" type="tel"> <br><br>
	
	주소 : <input name ="staffAddress" type="text"><br><br>
	
	진료과 : <input name="staffMedicalDepartment" type="text"><br><br>
	
	직원이미지 : 
	<input type="file" name="staffImg" accept=".png, .jpg" multiple="multiple">
	<br><br>
	
	<button type="submit">생성하기</button>
</form>








