<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
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
<h1>출퇴근 현황</h1>

<form method="get" autocomplete="off" class="search-form">
	이름 : <input type="text" name="staffName" value="${param.staffName}"><br>
	<br> 분류 : <label><input type="checkbox" name="type"
		value="출근">출근</label> <label><input type="checkbox"
		name="type" value="지각">지각</label> <label><input
		type="checkbox" name="type" value="조퇴">조퇴</label> <label><input
		type="checkbox" name="type" value="업무중">업무중</label> <br>
	<br> 날짜검색 : <input type="date" name="beginMade"
		value="${param.beginMade}"> ~ <input type="date"
		name="endMade" value="${param.endMade}"> <br>
	<br> 정렬 : <select name="sort">
		<option value="">선택하세요</option>
		<option value="staff_name asc">이름 순</option>
		<option value="department_name desc">의료진 분류 순</option>
		<option value="staff_grade asc">직급 순</option>
		<option value="attendance_start_time desc">최신 순</option>
	</select> <br>
	<br>
	<button type="submit">검색</button>
</form>

<div class="row p-3">
	<div class="col">
		<table class="table tbl paginated table-hover " id="tbl">
			<thead class="text-center">
				<tr class="bg-dark text-light">
					<th>진료과</th>
					<th>직책</th>
					<th>분류</th>
					<th>이름</th>
					<th>날짜</th>
					<th>출근시간</th>
					<th>퇴근시간</th>
					<th>출퇴근 상태</th>
					<th>근무시간</th>
				</tr>
			</thead>
			<tbody id="list" class="text-center">
				<c:forEach var="attendanceList" items="${attendanceList}">
					<tr>
						<td>${attendanceList.staffMedicalDepartment}</td>
						<td>${attendanceList.staffGrade}</td>
						<td>${attendanceList.dapartmentName}</td>
						<td>${attendanceList.staffName}</td>
						<td>${attendanceList.attendanceStartTime}</td>
						<td>${attendanceList.startTime}</td>
						<td>${attendanceList.endTime}</td>
						<td>${attendanceList.attendanceWorkState}</td>
						<td>${attendanceList.workTime}</td>
					<tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>






