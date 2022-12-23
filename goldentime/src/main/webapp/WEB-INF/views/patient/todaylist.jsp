<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="환자 현황" name="title" />
</jsp:include>
    <html>
	<head>
		<link rel="preconnect" href="https://fonts.googleapis.com">
	    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
	    
	    <style>
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
	    </style>
		</script>
	    <!-- Bootstrap CSS -->
  	  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	</head>
	<body>
		<div class="container-1200">
      <div class="container-fluid">  
      	<div>
      		<h1>금일 예약 목록</h1>
      	</div>
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
            	<c:forEach var="PatientReservationListVO"  items="${PatientReservationListVO}" >
               <tr>
               <c:choose>
               	<c:when test="${PatientReservationListVO.diagnosisNo != 0}">               	
                  <td><a href="/diagnosis/detail?diagnosisNo=${PatientReservationListVO.diagnosisNo}">${PatientReservationListVO.patientName}</a></td>
               	</c:when>
               	<c:otherwise>
               		<td><a href="/diagnosis/detail?reservationNo=${PatientReservationListVO.reservationNo}">${PatientReservationListVO.patientName}</a></td>
               	</c:otherwise>
               </c:choose>
                  <td>${PatientReservationListVO.patientGender}</td>
                  <td>${PatientReservationListVO.patientBlood}</td>
                  <td>${PatientReservationListVO.patientBirth}</td>
                  <td>${PatientReservationListVO.reservationDate}</td>
                  <td>${PatientReservationListVO.reservationTime}</td>
               </tr>
               </c:forEach>
            </tbody>
      		</table>
         <div>
         	<h1>금일 접수 목록</h1>
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
            <c:forEach var="PatientReceiveListVO"  items="${PatientReceiveListVO}" >
               <tr>
               <c:choose>
               	<c:when test="${PatientReceiveListVO.diagnosisNo != 0}">
                  <td><a href="/diagnosis/detail?diagnosisNo=${PatientReceiveListVO.diagnosisNo}">${PatientReceiveListVO.patientName}</a></td>
               	</c:when>
               	<c:otherwise>
               	 <td><a href="/diagnosis/detail?receiveNo=${PatientReceiveListVO.receiveNo}">${PatientReceiveListVO.patientName}</a></td>
               	</c:otherwise>
               </c:choose>
                  <td>${PatientReceiveListVO.patientGender}</td>
                  <td>${PatientReceiveListVO.patientBlood}</td>
                  <td>${PatientReceiveListVO.patientBirth}</td>
                  <td>${PatientReceiveListVO.receiveDate}</td>
                  <td>${PatientReceiveListVO.diagnosisNo}</td>
                  <td>${PatientReceiveListVO.receiveNo}</td>
               </tr>
               </c:forEach>
            </tbody>
         </table>
         </div>
      </div>
   </div>
</body>
</html>