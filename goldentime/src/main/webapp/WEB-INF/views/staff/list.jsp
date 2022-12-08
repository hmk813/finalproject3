<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="직원 검색" name="title"/>
</jsp:include>     
<h1>직원 검색</h1>

<!-- 복합검색창 -->
<form method="get" autocomplete="off" class="search-form">
	이름 : <input type="text" name="staffName" value="${param.staffName}"><br><br>
	부서번호 : <input type="number" name="staffDepartmentNo" value="${param.staffDepartmentNo}"><br><br>
	진료과 : <input type="text" name="staffMedicalDepartment" value="${param.staffMedicalDepartment}"><br><br>
	<br><br>
	
	<button type="submit">검색</button>
</form>

<!-- 결과화면 -->
<table width="500" align="center" border="1">
	<thead>
		<tr>
			<th>이름</th>
			<th>부서번호</th>
			<th>진료과</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="staffDto" items="${list}">		
		<tr>
			<td>${staffDto.staffName}</td>
			<td>${staffDto.staffDepartmentNo}</td>
			<td>${staffDto.staffMedicalDepartment}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>    