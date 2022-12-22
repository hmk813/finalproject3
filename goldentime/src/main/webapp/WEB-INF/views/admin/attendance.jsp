<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:useBean id="now" class="java.util.Date" />

<jsp:include page="/WEB-INF/views/template/mypageHeader.jsp">
	<jsp:param value="마이페이지" name="title" />
</jsp:include>

<script src="https://kit.fontawesome.com/188e96ed37.js"
	crossorigin="anonymous"></script>

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
<div class="row mt-4 px-3">
	<div class="col">
		<h4>
			<i class="fa-solid fa-circle-info"></i> 직원 출퇴근 목록
		</h4>
	</div>
</div>


<form method="get" autocomplete="off" class="search-form">
	<div class="row ">
		<div class="col text-center border">이름 검색</div>
		<div class="col border">
			<input class="w-100" type="text" name="staffName"
				value="${param.staffName}">
		</div>
		<div class="col"></div>
		<div class="col"></div>
	</div>
	<div class="row ">
		<div class="col text-center border">분류</div>
		<div class="col border">
			<label><input type="checkbox" name="type" value="출근">출근</label>
			<label><input type="checkbox" name="type" value="지각">지각</label>
			<label><input type="checkbox" name="type" value="조퇴">조퇴</label>
			<label><input type="checkbox" name="type" value="업무중">업무중</label>
		</div>
		<div class="col"></div>
		<div class="col"></div>
	</div>
	<div class="row ">
		<div class="col text-center border">날짜검색 검색</div>
		<div class="col border">
			<input type="date" name="beginMade" value="${param.beginMade}">
			~ <input type="date" name="endMade" value="${param.endMade}">
		</div>
		<div class="col"></div>
		<div class="col"></div>
	</div>
	<div class="row ">
		<div class="col text-center border">정렬</div>
		<div class="col border">
			<select name="sort">
				<option value="">선택하세요</option>
				<option value="staff_name asc">이름 순</option>
				<option value="department_name desc">의료진 분류 순</option>
				<option value="staff_grade asc">직급 순</option>
				<option value="attendance_start_time desc">최신 순</option>
			</select>
		</div>
		<div class="col"></div>
		<div class="col"></div>
	</div>

	<div class="row mt-3 px-3">
		<div class="col   px-3">
			<button type="submit" class="btn btn-primary">검색</button>
		</div>
		<div class="col "></div>
		<div class="col"></div>
		<div class="col"></div>
	</div>

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






