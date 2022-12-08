<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	$(function() {
		loadList();
	});
		//목록을 불러오는 함수
		function loadList() {
			$.ajax({
				url:"http://localhost:8888/rest/patient",
				method:"get",
				success:function(resp){
					//console.log(resp);
					for(var i = 0 ; i < resp.length; i++) {
						var h3 = $("<h3>").text(resp[i].patientNo+"/"+resp[i].patientName+"/"+resp[i].patientBirth+"/"+resp[i].patientGender+
								"/"+resp[i].patientBlood+"/"+resp[i].patientAddress+"/"+resp[i].patientPhone);
						$(".list-view").append(h3);
					}
				}
			});
		}
	

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-1000">
			<div class="row center">
				<h1>회원 접수</h1>
			</div>
			<form class="detail-view">
				<input name="patientName" type="text"  required><br><br>
				<input name="patientBirth" type="date" required><br><br>
				<input name="patientGender" type="text"  required><br><br>
				<input name="patientBlood" type="text" required><br><br>
				<input name="patientAddress" type="text"   required><br><br>
				<input name="patientPhone" type="tel"  required><br><br>
				<button type="submit">등록</button>
			</form>
			<div class="list-view">
			</div>
		</div>
		

</body>
</html>