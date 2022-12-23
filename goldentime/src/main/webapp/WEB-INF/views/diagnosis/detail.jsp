<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="환자 차트" name="title" />
</jsp:include>
<html>
<head>
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
	<c:set var="now" value="<%=new java.util.Date()%>" />
	<c:set var="Year"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>
	<c:set var ="birthYear"><fmt:formatDate value="${patientDto.patientBirth}" pattern="YYYY"/></c:set>
</head>
<body>
	<div class="container-1200">
		<div>
			<table>
				<thead>
					<tr>
						<th>차트번호</th>
						<th>이름</th>
						<th>성별</th>
						<th>생년월일</th>
						<th>주소지</th>
						<th>번호</th>
						<th>혈액형</th>
					</tr>
				</thead>
				<tbody>
				<tr>
                  <td>${diagnosisDto.diagnosisNo}</td>
                  <td>${patientDto.patientName}</td>
                  <td>${patientDto.patientGender}</td>
                  <td>${patientDto.patientBirth}(${Year- birthYear + 1} 세)</td>
                  <td>${patientDto.patientAddress}</td>
                  <td>${patientDto.patientPhone}</td>
                  <td>${patientDto.patientBlood}</td>
               </tr>
				</tbody>
			</table>
			
			<form action="detail" method="post">
			<c:if test="${diagnosisDto.diagnosisNo != 0 && diagnosisDto.receiveNo != 0}">
				<input name="diagnosisNo" type="hidden" value="${diagnosisDto.diagnosisNo}">
					<input name="diagnosisContent" type="text" placeholder="진단명" required value="${diagnosisDto.diagnosisContent}"><br><br>
					<input name="diagnosisTitle" type="text" placeholder="진료내용" required value="${diagnosisDto.diagnosisTitle}"><br><br>
					<input name="diagnosisMemo" type="text" placeholder="메모" required value="${diagnosisDto.diagnosisMemo}">
					<button type="submit">입력</button>
			</c:if>
			<c:if test="${diagnosisDto.diagnosisNo == 0 && diagnosisDto.receiveNo != 0}">
					<input name="diagnosisStaffId" type="text" value="${receiveDto.staffId}">
					<input name="diagnosisPatientNo" type="text" value="${patientDto.patientNo}">
					<input name="receiveNo" type="text" value="${receiveDto.receiveNo}">
					<input name="diagnosisContent" type="text" placeholder="진단명" required><br><br>
					<input name="diagnosisTitle" type="text" placeholder="진료내용" required><br><br>
					<input name="diagnosisMemo" type="text" placeholder="메모" required>
					<button type="submit">입력</button>
			</c:if>
			<c:if test="${diagnosisDto.diagnosisNo != 0 && diagnosisDto.reservationNo != 0}">
					<input name="diagnosisNo" type="hidden" value="${diagnosisDto.diagnosisNo}">
					<input class="input1" name="diagnosisContent" type="text" placeholder="진단명" required value="${diagnosisDto.diagnosisContent}"><br><br>
					<input class="input1" name="diagnosisTitle" type="text" placeholder="진료내용" required value="${diagnosisDto.diagnosisTitle}"><br><br>
					<input class="input1" name="diagnosisMemo" type="text" placeholder="메모" required value="${diagnosisDto.diagnosisMemo}">
					<button type="submit" class="btn1">입력</button>
			</c:if>
			<c:if test="${diagnosisDto.diagnosisNo == 0 && diagnosisDto.reservationNo != 0}">
					<input name="diagnosisStaffId" type="text" value="${reservationDto.reservationStaffId}">
					<input name="diagnosisPatientNo" type="text" value="${patientDto.patientNo}">
					<input name="reservationNo" type="text" value="${reservationDto.reservationNo}">
					<input name="diagnosisContent" type="text" placeholder="진단명" required><br><br>
					<input name="diagnosisTitle" type="text" placeholder="진료내용" required><br><br>
					<input name="diagnosisMemo" type="text" placeholder="메모" required>
					<button type="submit">입력</button>
			</c:if>
			</form>
		</div>
	<c:forEach var="chartList"  items="${chartList}">
		${chartList.diagnosisNo}
		${chartList.diagnosisPatientNo}
		${chartList.diagnosisDate}
		${chartList.diagnosisTime}
	</c:forEach>
	</div>
</body>
</html>