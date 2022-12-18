<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="직원 검색" name="title"/>
</jsp:include>

<style>
	.pagination {
		justify-content : center;
		display: flex;
		list-style: none;/* ul태그 점 제거 */
	}
	a {
  		text-decoration: none; /* 밑줄 없애기 */
	}
</style>

<h1>직원 검색</h1>

<!-- 검색창 -->
<form action="list" method="get" align="center">
<!--
	<c:choose>
		<c:when test="${param.type == 'staff_name'}">
			<select name="type" required>
				<option value="staff_name">이름</option>
				<option value="staff_department_no" selected>부서</option>
				<option value="staff_grade">직위</option>
				<option value="staff_medical_department">진료과</option>
			</select>
		</c:when>
		<c:when test="${param.type == 'member_tel'}">
			<select name="type" required>
				<option value="staff_name">이름</option>
				<option value="staff_department_no">부서</option>
				<option value="staff_grade" selected>직위</option>
				<option value="staff_medical_department">진료과</option>
			</select>
		</c:when>
		<c:when test="${param.type == 'member_grade'}">
			<select name="type" required>
				<option value="staff_name">이름</option>
				<option value="staff_department_no">부서</option>
				<option value="staff_grade">직위</option>
				<option value="staff_medical_department" selected>진료과</option>
			</select>
		</c:when>
		<c:otherwise>
			<select name="type" required>
				<option value="staff_name" selected>이름</option>
				<option value="staff_department_no">부서</option>
				<option value="staff_grade">직위</option>
				<option value="staff_medical_department">진료과</option>
			</select>
		</c:otherwise>
	</c:choose>
	 -->
	 <select name="type" required>
	 	<option value="staff_name">이름</option>
	 	<option value="department_name">부서</option>
	 	<option value="staff_grade">직위</option>
	 	<option value="staff_medical_department">진료과</option>
	 </select>
	
	<input type="search" name="keyword" required value="${param.keyword}">
	
	<button type="submit">검색</button>
</form>

<!-- 결과화면 -->
<table width="500" align="center" border="1">
	<thead>
		<tr>
			<th>이름</th>
			<th>부서번호</th>
			<th>직위</th>
			<th>진료과</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="staffDto" items="${staffList}">
		<tr>
			<td>${staffDto.staffName}</td>
			<td>${staffDto.departmentName}</td>
			<td>${staffDto.staffGrade}</td>
			<td>${staffDto.staffMedicalDepartment}</td>
		</tr>
		</c:forEach>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="4" align="right">
				총 ${staffList.size()}개의 결과
			</td>
		</tr>
	</tfoot>
</table>

<%-- 페이지 네비게이터 --%>
<div class="mt-10 mb-10" align="center">
	<ul class="pagination">
		<c:choose>
			<c:when test = "${staffSearchVO.isFirst()}">
				<li class="page-item">
					<a class="page-link" href = "">&laquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
					<a class="page-link" href = "list?p=${staffSearchVO.firstBlock()}&${staffSearchVO.parameter()}">&laquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test = "${staffSearchVO.hasPrev()}">
				<li class="page-item">
					<a class="page-link" href = "list?p=${staffSearchVO.prevBlock()}&${staffSearchVO.parameter()}">&lt;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
					<a class="page-link" href = "">&lt;</a>
				</li>
			</c:otherwise>
		</c:choose>
		
		<c:forEach var = "i" begin = "${staffSearchVO.startBlock()}" end = "${staffSearchVO.endBlock()}" step = "1">
			<li class="page-item">
				<a class="page-link" href = "list?p=${i}&${staffSearchVO.parameter()}">${i}</a>
			</li>
		</c:forEach>
		
		<c:choose>
			<c:when test = "${staffSearchVO.hasNext()}">
				<li class="page-item">
					<a class="page-link" href = "list?p=${staffSearchVO.nextBlock()}&${staffSearchVO.parameter()}">&gt;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
					<a class="page-link" href = "">&gt;</a>
				</li>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test = "${staffSearchVO.isLast()}">
				<li class="page-item">
					<a class="page-link" href = "">&raquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
					<a class="page-link" href = "list?p=${staffSearchVO.lastBlock()}&${staffSearchVO.parameter()}">&raquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>