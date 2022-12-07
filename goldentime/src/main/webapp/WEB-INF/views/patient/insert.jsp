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
		<input name="patientName" type="text" id="name" required><br><br>
		<input name="patientBirth" type="date" id="birth" required><br><br>
		<input name="patientGender" type="text" id="gender" required><br><br>
		<input name="patientBlood" type="text" id="blood" required><br><br>
		<input name="patientAddress" type="text"  id="address" required><br><br>
		<input name="patientPhone" type="tel"  id="phone" required><br><br>
		<button type="submit" id="button">등록</button>
		
		<br><br>
		
		<div id="ajaxReturn"></div>
	</form>
	
	<script type="text/javascript">
		$(function () {
    		$("#button").click(function () {
        		$.ajax({
		            data : {
		                이름 : $("#name").val(),
		                생년월일 : $("#birth").val(),
		               	성별 : $("#gender").val(),
		               	혈액형 : $("#blood").val(),
		               	주소 : $("#address").val(),
		               	핸드폰 번호 : $("#phone").val(),
		            },
		            success : function(data){
		                alert("success");
		                //check.jsp에서 DB확인해서 출력은 index에서
		                $("#ajaxReturn").html(data);
		            },
		            error : function(){
		                alert("error");
		            }
        });
    });
});
</script>
</body>
</html>