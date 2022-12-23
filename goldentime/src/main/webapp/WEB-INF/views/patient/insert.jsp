<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<%-- 템플릿 페이지인 header.jsp를 동적으로 불러와라 --%>
<jsp:include page="/WEB-INF/views/template/department.jsp">
	<jsp:param value="환자 접수" name="title"/>
</jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골든타임 병원</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<style>
.div1{
	margin-left: 460px;
}
.p1{
	font-size: 34px;
	color: #3f3f3f;
	text-align: center;
}
.form-control{
	border: 1px solid #4e73df;
	border-radius: 0.7em;
	color: #3f3f3f;
	width: 300px;
	heigth: 30px;
	margin-top: 10px;
}
.form-control:hover,
.form-control:focus{
	border: 2px solid #4e73df;
	outline: none;
}
.btn{
	border: 1px solid #4e73df;
	border-radius: 0.7em; 
	color: #FFF;
	background-color: #4e73df;
	width: 300px;
	heigth: 30px;
	margin-top:10px;
}
.btn:hover{
	color:#FFF;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	$(function(){
		 
		$.ajax({
            url: "http://localhost:8888/rest/staff/list",
            method: "get",
            success: function (resp) {
                if (resp != null) {
                    var staff = resp;
                    for (var i = 0; i < staff.length; i++) {
                        if (staff[i].staffDepartmentNo == 1) {
                            $(".doctor-reservation-select").append($("<option>").append(staff[i].staffMedicalDepartment + "-" + staff[i].staffName).addClass("reservation-option").val(staff[i].staffId));
                        }
                    }
                } else {
                    console.log("실패");
                }
            }
        });
		$(".form-insert-con").submit(function(e){
			e.preventDefault();
			var form = this;
			
			$.ajax({
				url:"http://localhost:8888/rest/patient/vo?patientName="+$("#patientName").val()+"&patientPhone="+$("#patientPhone").val(),
				method:"get",
				success:function(resp){
					if(resp != 0){ // 접수만
						$("[name=patientName]").append($("<input type=text name=patientNo>").val(resp[0].patientNo));
						$(form).attr("action","insert1");
						
					}else{	// 환자, 접수 같이
						$(form).attr("action","insert");
					}
					form.submit();
				}
			});
		});
	});
</script>
<style>

</style>
</head>
	<p class="p1">예약/접수</p>
<div class="div1">
<form class="form-insert-con" method="post">
				<select name="staffId" class="form-control doctor-reservation-select mb-3">
					<option class="select-option">선택</option>
				</select> 
				<input class="form-control" id="patientName" name="patientName" type="text"  placeholder="이름" required>
				<input class="form-control" name="patientBirth" type="date"  required>
				<input class="form-control" name="patientGender" type="text"  required placeholder="성별">
				<input class="form-control" name="patientBlood" type="text"  placeholder="혈액형"  required>
				<input class="form-control" name="patientAddress" type="text"  placeholder="주소"  required>
				<input class="form-control" id="patientPhone" name="patientPhone" type="tel"  placeholder="핸드폰번호"  required>
				<button type="submit" id="test" class="btn">등록</button>

</form>
</div>
</html>