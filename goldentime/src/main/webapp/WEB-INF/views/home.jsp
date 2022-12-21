<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="홈" name="title"/>
</jsp:include>

<html>
<head>


<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<!-- Bootswatch CDN -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.0.2/cosmo/bootstrap.min.css">
	<link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<img src="../image/home.png" class="img-thumbnail" alt="홈">
</head>
<style>
	div.fixed {
     border: 2px solid #B8860B;
     width: 250px;
     position: fixed;
	}

	.time{
		position:absolute;
		top:150px;
		left:350px;
	}
	
	.time1{
		position:absolute;
		top:250px;
		left:450px;
	}
	
	.title{
		position:absolute;
		top:150px;
		right:200px;
	}
	
	.paragraph{
		position:absolute;
		top:300px;
		left:350px;
	}

</style>


<body>
		
		<div class="row mt-4">
				<div class="text-center">
					<h1 id="yoil" class="time"></h1>
					<h2 style="font-weight: bold;" id="realTime" class="time1"></h2>
				</div>
		</div>
	
		<div class="row mt-4">
			<div class="text-center">
				<h1 class="title" style="font-weight:bold; font-size:50px;">드림병원에 오신걸 환영합니다.</h1>
			</div>
		
		</div>


	<div class="row mt-4">
		<div class="text-center">
			<h2 class="paragraph" style="font-weight:bold; font-size:25px;">선생님!<br> 오늘 하루도 파이팅 하세요!</h2>
		</div>
	</div>

	<script>
        $(function () {

            setInterval(function () {
                date = new Date();

                year = date.getFullYear();
                month = date.getMonth() + 1;
                day = date.getDate();
                hour = date.getHours();
                minutes = date.getMinutes();
                seconds = date.getSeconds();
                week = new Array("일", "월", "화", "수", "목", "금", "토");

                weekday = week[date.getDay()];

                if (hour < 10) {
                    hour = "0" + hour;
                }
                if (minutes < 10) {
                    minutes = "0" + minutes;
                }
                if (seconds < 10) {
                    seconds = "0" + seconds;
                }

                $("#realTime").html(
                    hour + ":" + minutes + ":" + seconds
                );
                $("#yoil").html(
                		year + "-" + month + "-" + day + " " + weekday + "요일"
                );
            });
        });
    </script>


</body>
</html>