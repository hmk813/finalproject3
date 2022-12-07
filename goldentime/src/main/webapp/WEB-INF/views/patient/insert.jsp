<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환자 접수</title>
</head>
<body>
	<h1>환자 접수</h1>
	<form action="insert" method="post">
		<input name="patientName" type="text" required><br><br>
		<input name="patientBirth" type="date" required><br><br>
		<input name="patientGender" type="text" required><br><br>
		<input name="patientBlood" type="text" required><br><br>
		<input name="patientAddress" type="text" required><br><br>
		<input name="patientName" type="tel" required><br><br>
		<button>등록</button>
	</form>
</body>
</html>