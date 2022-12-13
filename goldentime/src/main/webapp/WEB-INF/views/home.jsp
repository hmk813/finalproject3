<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%-- 템플릿 페이지인 header.jsp를 동적으로 불러와라 --%>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="메인페이지" name="title"/>
</jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골든타임 병원</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link href="/resources/css/reset.css" rel="stylesheet">
<link href="/resources/css/commons.css" rel="stylesheet">
<link href="/resources/css/layout.css" rel="stylesheet">
<link href='fullcalendar/lib/main.css' rel='stylesheet' />
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src='fullcalendar/lib/main.js'></script>
<style>
 html, body{
            margin:0;
            padding:0;
        }

        main, header, aside, section, footer, nav, div {
            border:1px dotted black;
        }
        main {
            width: 1000px;
            margin:0 auto;
        }
        header {
            padding: 20px;
        }
        nav {
            
        }
        aside {
            padding: 20px;
            float:left;
            width:25%;
            min-height: 400px;
        }
        section {
            padding: 20px;
            float:left;
            width:75%;
            min-height: 400px;
        }
        footer {
            padding: 20px;
        }

</style>
</head>
<body>
    <!-- main은 영역의 시작과 끝을 의미 -->
    <main>

	


    </main>
</body>

</html>