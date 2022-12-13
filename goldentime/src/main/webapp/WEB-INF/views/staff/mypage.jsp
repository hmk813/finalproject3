<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootswatch CDN -->
    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.2.2/spacelab/bootstrap.min.css">

    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="resources/css/commons.css">
<link rel="stylesheet" type="text/css" href="resources/css/style.css">
  

<jsp:include page="/WEB-INF/views/template/mypageHeader.jsp">
	<jsp:param value="마이페이지" name="title"/>
</jsp:include>

<jsp:include page="/WEB-INF/views/calendar.jsp">
	<jsp:param value="달력" name="title"/>
</jsp:include>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
</style>

<body>
   <section>
  	<table border="1" width="400" height="300">
  		<tbody>
  			<tr>
				<th colspan="2">
				<div style="text-align:center" class="image-box">
				 <img class="img-thumbnail"  src="../image/test.jpg" alt="테스트 사진"  width="150" height="150">
				</div>
				</th>
				
				<h4>내정보</h4>
			<tr>
				<th>이름</th>
				<td>${staffDto.staffName}</td>
			</tr>
			<tr>
				<th>진료과</th>
				<td>${staffDto.staffMedicalDepartment}</td>
			</tr>			
			<tr>
			
			<div class="row col-3">진료과
						<div>내과</div>
						<div>외과</div>
						<div>정형외과</div>
						<div>영상의학과</div>
			</div>
			

			<div class="row">
			<div>근태관리</div>
			<div>출근시간 ${attendanceDto.startTime}</div>
			<div>퇴근시간 ${attendanceDto.endTime}</div>
			</div>
				
			<div>
			
						
		<td><a href="password">비밀번호 변경</a></td>
		<td><a href="information">개인정보 변경</a></td> 
			</tr>
		</tbody>
	</table>		
	
   </section>
	
</body>
<%-- <div align="left">
	<h1>사원 정보</h1>
	<table border="1" width="350" height="300">
		<tbody>
			<!-- 프로필 이미지를 출력 -->
			<tr>
				<th colspan="2">
				<div style="text-align:left" class="image-box">
				 <img class="img-thumbnail"  src="../image/test.jpg" alt="테스트 사진"  width="150" height="150">
				</div>
				</th>
			</tr>
		
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
				<th>진료과</th>
				<td>${staffDto.staffMedicalDepartment}</td>
			</tr>			
			<tr>
				<th>주소</th>
				<td>${staffDto.staffAddress}</td>
			</tr>
			<tr>
				<th>등급</th>
				<td>
					${staffDto.staffGrade}
				</td>
			</tr>
			<tr>
				<th>입사일</th>
				<td>
					<fmt:formatDate value="${staffDto.staffEnrollDate}" pattern="y년 M월 d일 E a h시 m분 s초"/>
				</td>
			</tr>
		</tbody>
	</table>
	
		
		<h2><a href="password">비밀번호 변경</a></h2>
		<h2><a href="information">개인정보 변경</a></h2> --%>

	
	<!-- <table>
	<tbody>
			<tr>
			<th>근태관리</th>
			<td>출근</td>
			<td>퇴근</td>
			</tr>
			</tbody>
	</table> -->
	
	<!-- <form action="/upload" method="post" enctype="multipart/form-data">
		<input type="file" name="attachment"><br><br>
		<button type="submit">등록</button>
	
	</form>	 -->
	
<%-- 	<c:choose>
		<c:when test="${staffGrade == '관리자'}">
			<!-- 관리자용 메뉴 -->
			<h2><a href="list">목록 보기</a></h2>
			<h2><a href="change?staffId=${staffDto.staffId}">정보 변경</a></h2>
			<h2><a href="/">로그아웃</a></h2>
		</c:when>
	<c:otherwise> --%>

</body>

