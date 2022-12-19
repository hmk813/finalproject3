<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골든타임 병원</title>

<!--fullcalendar css-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

    <!-- fullcalendar CDN -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
    <!-- fullcalendar 언어 CDN -->
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
    <!-- moment CDN (format사용하기 위해)-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
    <script type="text/javascript"></script>

<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="홈" name="title"/>
</jsp:include>


</html>


