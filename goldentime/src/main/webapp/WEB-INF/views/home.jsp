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
	
	.main-sp{
	margin-top: 140px;
	text-align: center;
	font-size: 34px;
	font-weight: 700;
	}
	.main-sp2{
	text-align: center;
	font-size: 34px;
	font-weight: 700;
	}
	
	.time{
	margin-left: 370px;
	margin-top: 250px;
	font-size: 26px;
	font-weight: 700;
	color: #3f3f3f;
	}
	
	.time1{
	margin-left: 270px;
	margin-top: 300px;
	font-size: 50px;
	border: 2px solid  #f4e081;
	border-radius: 0.7em;
	padding: 5px 5px 5px 5px;
	}
	
	/*  */
	
	
	

</style>


	<body>
		<div class="main-sp">
			<span style="color: #049ad7;">D</span>
			<span style="color:#e0c024;">R</span>
			<span style="color:#e22413;">E</span>
			<span style="color:#44ab34;">A</span>
			<span style="color:#e0c024;">M</span>
			<br>
			<span style="color:#44ab34;">H</span>
			<span style="color:#e0c024;">O</span>
			<span style="color: #049ad7;">S</span>
			<span style="color:#44ab34;">P</span>
			<span style="color: #049ad7;">I</span>
			<span style="color:#e0c024;">T</span>
			<span style="color:#e22413;">A</span>
			<span style="color:#44ab34;">L</span>
		</div>
		
		<div class="main-sp2">
			<span style="color: #049ad7;">드</span>
			<span style="color:#e0c024;">림</span>
			<span style="color:#e22413;">병</span>
			<span style="color:#44ab34;">원</span>
		</div>
		
		<div>
				<p id="yoil" class="time"></p>
		</div>
			
		<div>
				<p style="font-weight: bold;" id="realTime" class="time1"></p>
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