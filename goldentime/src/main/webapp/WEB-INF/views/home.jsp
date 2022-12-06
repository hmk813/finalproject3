<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 템플릿 페이지인 header.jsp를 동적으로 불러와라 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="메인페이지" name="title"/>
</jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골든타임 병원</title>
<script></script>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link href="/resources/css/home.css" rel="stylesheet">
<link href="/resources/css/reset.css" rel="stylesheet">
<link href='fullcalendar/lib/main.css' rel='stylesheet' />
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src='fullcalendar/lib/main.js'></script>

	<style>
    </style>

</head>
<body>
		<div class="float-container">
		
			<aside>사이드바</aside>
			
			<section>컨텐츠</section>
		
		</div>
	</main>
</body>
</html>