<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="직원 검색" name="title"/>
</jsp:include>     
<h1>직원 검색</h1>

<!-- 검색창 -->
	<form action="list" method="get" autocomplete="off">
		<select name="type" required>
			<option>이름</option>
			<option>부서번호</option>
			<option>진료과</option>
		</select>
		<input name="keyword" required>
	
	
	<button type="submit">검색</button>

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
</form>