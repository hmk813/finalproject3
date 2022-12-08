<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <html>
	<head>
		<link rel="preconnect" href="https://fonts.googleapis.com">
	    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
	    
	    <!-- Bootstrap CSS -->
  	  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	
	  	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
		<script>
		$(function(){
			
			//  수술 환자 목록 상세 숨김 
			$(".show-operation-list").hide();
			
			$(".operation-list").click(function(){
				$(".show-operation-list").toggle();
			});
		});
		</script>	
		</head>
<body>
	<div class="container-1200">
		<div class="container-fluid">
		
		<div>
			<h1> 수술 환자 목록</h1>
		</div>
		
		<div >
			<table>
				<thead>
					<tr>
						<th>환자번호</th>
						<th>이름</th>
						<th>진단명</th>
					</tr>
				</thead>
				<tbody class="operation-list">
				<c:forEach var="opertaionVO" items="${operationInformationVO}" >
					<tr>
						<td>${opertaionVO.patientNo}</td>
						<td>${opertaionVO.patientName}</td>
						<td>${opertaionVO.diagnosisTitle}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
					
			<div>
				<h1>수술 환자 상세</h1>
			</div>
			
			<div>
				<table>
					<thead>
						<tr>
							<th>환자번호</th>
							<th>환자명</th>
							<th>나이</th>
							<th>성별</th>
							<th>혈액형</th>
							<th>수술번호</th>
							<th>수술방</th>
							<th>수술 시작 시간</th>
							<th>수술 종료 시간</th>
							<th>보호자 동의</th>
						</tr>
					</thead>
					<tbody  class="show-operation-list">
					<c:forEach var="opertaionListVO" items="${operationInformationVO}" >
						<tr>
							<td>${opertaionListVO.patientNo}</td>
							<td>${opertaionListVO.patientName}</td>
							<td>${opertaionListVO.patientBirth}</td>
							<td>${opertaionListVO.patientGender}</td>
							<td>${opertaionListVO.patientBlood}</td>
							<td>${opertaionListVO.operationNo}</td>
							<td>${opertaionListVO.operationNo}</td>
							<td>${opertaionListVO.operationRoomNo}</td>
							<td>${opertaionListVO.operationStartDay}</td>
							<td>${opertaionListVO.operationEnd}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
		</div>
	</div>
	
</body>
</html>