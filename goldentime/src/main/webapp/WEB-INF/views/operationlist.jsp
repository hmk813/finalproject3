<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <html>
	<head>
		<link rel="preconnect" href="https://fonts.googleapis.com">
	    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
	
	  	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
		<script>
	
		</script>	
		</head>
<body>
	<div>
		<div class="row">
			<h1> 수술 환자 목록</h1>
		</div>
		
		<div>
			<table>
				<thead>
					<tr>
						<th>환자번호</th>
						<th>이름</th>
						<th>진단명</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="operationInformationVO" >
					<tr>
						<td>${operationInformationVO.patientNo}</td>
						<td>${operationInformationVO.patientName}</td>
						<td>${operationInformationVO.diagnosisTitle}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
</body>
</html>