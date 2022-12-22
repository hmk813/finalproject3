<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="내과 환자 현황" name="title" />
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
	<style>
	.p1{
		font-size: 34px;
		font-weight: 700;
		color: #3f3f3f;
	}
	.p2{
		font-size: 34px;
		font-weight: 700;
		color: #3f3f3f;
	}
	/*  */
	
	table {
  border: 1px #a39485 solid;
  font-size: .9em;
  box-shadow: 0 2px 5px rgba(0,0,0,.25);
  width: 100%;
  border-collapse: collapse;
  border-radius: 5px;
  overflow: hidden;
}

th {
  text-align: left;
}
  
thead {
  font-weight: bold;
  color: #fff;
  background: #73685d;
}
  
 td, th {
  padding: 1em .5em;
  vertical-align: middle;
}
  
 td {
  border-bottom: 1px solid rgba(0,0,0,.1);
  background: #fff;
}

a {
  color: #73685d;
}
  
 @media all and (max-width: 768px) {
    
  table, thead, tbody, th, td, tr {
    display: block;
  }
  
  th {
    text-align: right;
  }
  
  table {
    position: relative; 
    padding-bottom: 0;
    border: none;
    box-shadow: 0 0 10px rgba(0,0,0,.2);
  }
  
  thead {
    float: left;
    white-space: nowrap;
  }
  
  tbody {
    overflow-x: auto;
    overflow-y: hidden;
    position: relative;
    white-space: nowrap;
  }
  
  tr {
    display: inline-block;
    vertical-align: top;
  }
  
  th {
    border-bottom: 1px solid #a39485;
  }
  
  td {
    border-bottom: 1px solid #e5e5e5;
  }
  
  
  }
	</style>
	<body>
      	<div>
      		<p class="p1">금일 예약 목록</p>
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
         	<p class="p2">금일 접수 목록</p>
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
</body>
</html>