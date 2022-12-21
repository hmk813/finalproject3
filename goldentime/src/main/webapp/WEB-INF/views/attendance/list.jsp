<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />

<jsp:include page="/WEB-INF/views/template/mypageHeader.jsp">
	<jsp:param value="마이페이지" name="title" />
</jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근무 조회</title>

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

</head>
<body>
	<div class="container-fluid">

		<div class="row mt-4">
			<div class="col ms-4">
				
				<h4><i class="fa-solid fa-circle-info" style="font-size: 20px"></i> 내 출퇴근 조회</h4>
			</div>
		</div>

		

		<div class="row mt-4">
			<div class="col p-2 border rounded shadow ms-5">
				<div class="text-center">
					<p id="yoil"></p>
					<h3 style="font-weight: bold;" id="realTime"></h3>
				</div>
				<div class="row text-center mb-3">
					<div class="col">출근시간</div>
					<div class="col">
						${startEnd.startTime}
					</div>
				</div>
				<div class="row text-center">
					<div class="col">퇴근시간</div>
					<div class="col">${startEnd.endTime}</div>
				</div>
			</div>
			
			<div class="col p-2 border rounded shadow ms-5 me-5">
				<table class="table table-hover">
					<thead class="text-center">
						<tr>
							<th colspan="2">이번달 출근 현황</th>
						</tr>
					</thead>
					<tbody class="text-center">
						<c:forEach var="thismonth" items="${thismonth}">
							<tr>
								<td>${thismonth.attendanceWorkState}</td>
								<td>${thismonth.day}</td>
							<tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<div class="row mt-4 ms-5 me-5">
			<div class="col mt-4">
				<form method="get" action="list" class="search-form">
					<input type="date" name="beginMade" style="height:50px"> ~ <input type="date"
						name="endMade" style="height:50px">
					<button type="submit" class="" style="height:50px; background-color : #81BEF7; border-color : #81BEF7;">검색</button>
				</form>
			</div>
		</div>

		<div class="row mt-4 ms-5 me-5">
			<div class="col">
				<table class="table table-hover">
					<thead class="text-center">
						<tr class="bg-dark text-light">
							<th>업무 시간</th>
							<th>출근 시간</th>
							<th>퇴근 시간</th>
							<th>근무 상태</th>
							<th>총 근무 시간</th>
						</tr>
					</thead>
					<tbody class="text-center">
						<c:forEach var="attendaceList" items="${attendaceList}">
							<tr>
								<td>${attendaceList.attendanceStartTime}</td>
								<td>${attendaceList.startTime}</td>
								<td>${attendaceList.endTime}</td>
								<td>${attendaceList.attendanceWorkState}</td>
								<td>${attendaceList.workTime}</td>
							</tr>
						</c:forEach>
					</tbody>
					</tbody>
				</table>
			</div>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
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
                		year + "년" + month + "월" + day + "일" + "(" + weekday + ")"
                );
            });
        });
        
        $(function() {
    		
    		$(".search-form").submit(function(e) {

    			$(this).find("[name]").each(function() {
    				var value = $(this).val();
    				if (value.length == 0) {
    					
    					$(this).removeAttr("name");
    				}
    			});

    			return true;
    		});
    	});

    	
    	$(function() {
    		var param = new URLSearchParams(location.search);

    		var type = param.getAll("type");
    		for (var i = 0; i < type.length; i++) {
    			$("[name=type][value=" + type[i] + "]").prop("checked", true);
    		}

    		var sort = param.getAll("sort");
    		for (var i = 0; i < sort.length; i++) {
    			$("[name=sort]").eq(i).val(sort[i]);
    		}	
    	});
    </script>


</body>
</html>