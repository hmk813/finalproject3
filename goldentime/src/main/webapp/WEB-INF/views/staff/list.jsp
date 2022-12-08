<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="직원 검색" name="title"/>
</jsp:include>     
<h1>직원 검색</h1>

<!-- 검색창 -->
<form method="get" autocomplete="off" class="search-form">
	아이디 : <input type="text" name="staffId" value="${param.staffId}"><br><br>
	이름 : <input type="text" name="staffName" value="${param.staffName}"><br><br>
	부서번호 : <input type="number" name="staffDepartmentNo" value="${param.staffDepartmentNo}"><br><br>
	<br><br>
	
	<button type="submit">검색</button>
</form>

<!-- 결과화면 -->
<table width="500" align="center" border="1">
	<thead>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>부서번호</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="staffDto" items="${list}">		
		<tr>
			<td>${staffDto.staffId}</td>
			<td>${staffDto.staffName}</td>
			<td>${staffDto.staffDepartmentNo}</td>
		</tr>
		</c:forEach>
	</tbody>
</table>    