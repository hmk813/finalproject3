<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="환자 차트" name="title" />
</jsp:include>
<html>
<head>
	<style type="text/css">
		div{
			border: 1px solid gray;
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
			<input name="diagnosisNo" type="hidden" value="${diagnosisDto.diagnosisNo}">
			<input name="diagnosisContent" type="text" placeholder="진단명" required value="${diagnosisDto.diagnosisContent}"><br><br>
			<input name="diagnosisTitle" type="text" placeholder="진료내용" required value="${diagnosisDto.diagnosisTitle}"><br><br>
			<input name="diagnosisMemo" type="text" placeholder="메모" required value="${diagnosisDto.diagnosisMemo}">
			<button type="submit">입력</button>
			</form>
		</div>
	
	</div>
</body>
</html>