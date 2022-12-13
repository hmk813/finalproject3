<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

</head>
<body>
	<div class="container-fluid">

		<div class="row mt-4">
			<div class="col-md-10 offset-md-1 p-4">
				<h1 class="text-center">내 출퇴근 조회</h1>
			</div>
		</div>


		<form method="get" action="list" class="search-form">
			<input type="date" name="beginMade"> ~ <input type="date"
				name="endMade"> 
			<button type="submit">검색</button>
		</form>

		<div class="row mt-4">
			<div class="col-md-10 offset-md-1">
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
		//목표 : .search-form 전송을 차단하고 신규 form을 만들어서 입력한것만 전송
		$(function() {

			$(".search-form").submit(function(e) {

				$(this).find("[name]").each(function() {
					var value = $(this).val();
					if (value.length == 0) {//입력이 안된 경우
						//현재 입력창의 name을 제거
						$(this).removeAttr("name");
					}
				});

				return true;//전송
			});
		});

		$(function() {
			var param = new URLSearchParams(location.search);
		});
	</script>








</body>
</html>