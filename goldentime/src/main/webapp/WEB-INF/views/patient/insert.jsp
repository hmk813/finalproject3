<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<%-- 템플릿 페이지인 header.jsp를 동적으로 불러와라 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
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
 html, body{
            margin:0;
            padding:0;
        }

        main, header, aside, section, footer, nav, div {
            border:1px;
        }
        main {
            width: 800px;
            margin:0 auto;
        }
        header {
            padding: 20px;
        }
        nav {
            
        }
        aside {
            padding: 20px;
            float:left;
            width:25%;
            min-height: 400px;
        }
        section {
            padding: 20px;
            float:left;
            width:75%;
            min-height: 400px;
        }
        footer {
            padding: 20px;
        }
        
        .container{
        	position:relative;
			bottom:400px;
			left:0px;
			right:50px;
        }
        
        .myinfo{
        	position:absolute;
        	top:80%;
        	right:70%;
        	transform:translate(-10%,-80%);
        	border:black 1px solid;
        	      	
        }
        
        .notice{
        	position:absolute;
        	bottom:10%;
        	left:55%;
        	transform:translate(-10%,40%);
        	border:black 1px solid;
        }
        
        .attendance{
        	position:absolute;
        	bottom:10%;
        	left:20%;
        	transform:translate(-10%,-40%)
        	border:green1px solid;    	
        }
        
        .btn-start{
        	position: absolute;
        	bottom:10%;
        	left:20%;
        	width:30%;

        }
        
        .btn-finish{
   			position: absolute;
        	bottom:10%;
        	left:20%;
        	width:30%;
        }

</style>
</head>
<form class="form-insert-con" method="post">
<table border="1" width="500">
	<tbody>
		<tr>
			<th>진료 의사</th>
			<td>
				<select name="staffId" class="form-control doctor-reservation-select mb-3">
					<option class="select-option">선택</option>
				</select> 
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
				<input class="form-control" id="patientName" name="patientName" type="text"  placeholder="이름" required><br><br>
				<input class="form-control" name="patientBirth" type="date"  required><br><br>
				<input class="form-control" name="patientGender" type="text"  required placeholder="성별"><br><br>
				<input class="form-control" name="patientBlood" type="text"  placeholder="혈액형"  required><br><br>
				<input class="form-control" name="patientAddress" type="text"  placeholder="주소"  required><br><br>
				<input class="form-control" id="patientPhone" name="patientPhone" type="tel"  placeholder="핸드폰번호"  required><br><br>
				<button type="submit" id="test">등록</button>
			</td>
		</tr>
	</tbody>

</table>

</form>
</html>