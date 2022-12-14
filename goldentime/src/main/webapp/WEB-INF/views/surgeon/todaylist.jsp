<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="외과 환자 현황" name="title" />
</jsp:include>

    <html>
	<head>
		<link rel="preconnect" href="https://fonts.googleapis.com">
	    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
	    
	    <!-- Bootstrap CSS -->
  	  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	</head>
	<body>
		<div class="container-1200">
      <div class="container-fluid">  
      	<div>
      		<h1>외과 금일 예약 목록</h1>
      	</div>
      	<div>
      		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
      			<thead>
               	<tr>
                  <th>환자명</th>
                  <th>성별</th>
                  <th>혈액형</th>                  
                  <th>생년월일</th>
                  <th>예약일</th>
                  <th>예약시간</th>
               </tr>
            </thead>
            <tbody>
            <c:forEach var="PatientReservationDepartmentVO"  items="${PatientReservationDepartmentVO}" >
               <tr>
                  <td>${PatientReservationDepartmentVO.patientName}</td>
                  <td>${PatientReservationDepartmentVO.patientGender}</td>
                  <td>${PatientReservationDepartmentVO.patientBlood}</td>
                  <td>${PatientReservationDepartmentVO.patientBirth}</td>
                  <td>${PatientReservationDepartmentVO.reservationDate}</td>
                  <td>${PatientReservationDepartmentVO.reservationTime}</td>
               </tr>
               </c:forEach>
            </tbody>
      		</table>
      	</div>
         <div>
         	<h1>외과 금일 접수 목록</h1>
     	 </div>
      <div>
         <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
            <thead>
               <tr>
                  <th>환자명</th>
                  <th>성별</th>
                  <th>혈액형</th>                  
                  <th>생년월일</th>
                  <th>최종진료일</th>
               </tr>
            </thead>
            <tbody>
            <c:forEach var="PatientDepartmentVO"  items="${PatientDepartmentVO}" >
               <tr>
                  <td><a href="/diagnosis/detail?diagnosisNo=${PatientReceiveListVO.diagnosisNo}">${PatientDepartmentVO.patientName}</a></td>
                  <td>${PatientDepartmentVO.patientGender}</td>
                  <td>${PatientDepartmentVO.patientBlood}</td>
                  <td>${PatientDepartmentVO.patientBirth}</td>
                  <td>${PatientDepartmentVO.receiveDate}</td>
               </tr>
               </c:forEach>
            </tbody>
         </table>
         </div>
      </div>
   </div>
</body>
</html>