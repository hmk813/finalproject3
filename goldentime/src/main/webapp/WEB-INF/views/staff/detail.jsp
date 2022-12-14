<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

<%-- 관리자 메뉴일 경우와 아닐 경우 다른 헤더를 설정 --%>
<c:choose>
	<c:when test="${mg == '관리자'}">
		<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
			<jsp:param value="${staffDto.staffId} 직원 상세 정보" name="title"/>
		</jsp:include>
	</c:when>
	<c:otherwise>
		<jsp:include page="/WEB-INF/views/template/adminHeader.jsp">
			<jsp:param value="${staffDto.staffId} 직원 상세 정보" name="title"/>
		</jsp:include>
	</c:otherwise>
</c:choose>

<style>
	th {
		text-align: center;
		font-size: 17px;
	}
	.row {
		text-align: center;
	}
	a {
		color: #FFF;
	}
	a:hover {
		text-decoration: none;
	}
	.change {
		border: 2px solid #4e73df;
		border-radius: 0.7em;
		background-color: #4e73df;
		color: #FFF;
		width: 250px;
		height:30px;
	}
</style>

	<div class="row mt-4">
	
    	<div class="col-md-10 offset-md-1">
    	
			<h1 class="text-center font-weight-bold">${staffDto.staffName} 직원 상세정보</h1>
	        <table class="table table-hover">
	            <tbody>
		            <!-- 직원사진 출력 -->
		            <tr>
			            <th colspan="2">
							<img src="/attachment/download/staff?attachmentNo=${attachmentNo}" width="100" height="100">
			            </th>
		            </tr>
					<tr>
						<th width="25%">아이디</th>
						<td>${staffDto.staffId}</td>
					</tr>
	<!-- 				<tr> -->
	<!-- 					<th>부서</th> -->
	<%-- 					<td>${staffDto.departmentName}</td> --%>
	<!-- 				</tr> -->
					<tr>
						<th>이름</th>
						<td>${staffDto.staffName}</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>${staffDto.staffBirth}</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>${staffDto.staffPhone}</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${staffDto.staffAddress}</td>
					</tr>
					<tr>
						<th>직급</th>
						<td>${staffDto.staffGrade}</td>
					</tr>
					<tr>
						<th>입사일</th>
						<td>
							<fmt:formatDate value="${staffDto.staffEnrollDate}" pattern="y년 M월 d일 E a h시 m분 s초"/>
						</td>
					</tr>
				</tbody>
	        </table>
	        
			<c:choose>
				<c:when test="${mg == '관리자'}">
				<!-- 관리자 -->
					<div class="col-md-10 offset-md-1">
						<a href="list">목록 보기</a> &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
<%-- 						<a href="delete?staffId=${staffDto.staffId}">비밀번호 변경</a> --%>
					</div>
				</c:when>
				<c:otherwise>
				<!-- 회원 -->
					<div class="div4">
						<button type="submit" class="change">
							<a href="information?staffId=${staffDto.staffId}">직원정보 변경</a>
						</button>
					</div>
<!-- 					<div class="col-md-10 offset-md-1"> -->
<%-- 						<a href="information?staffId=${staffDto.staffId}">직원정보 변경</a> &nbsp;&nbsp;&nbsp; --%>
<!-- 						<a href="password">비밀번호 변경</a> &nbsp;&nbsp;&nbsp; -->
<!-- 					</div> -->
				</c:otherwise>
			</c:choose>
		
	    </div>
	    
	</div>
