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
<title>드림 병원</title>

<!--fullcalendar css-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<!-- fullcalendar CDN -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<!-- fullcalendar 언어 CDN -->
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<!-- moment CDN (format사용하기 위해)-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<style>

/* 디자인 시작 */
a {
	color: #3f3f3f;
}
.myinfo {
	border: 1px solid transparent;
	margin-left: 30px;
	}
.p1 {
	font-size: 24px;
	font-weight: 700;
	color: #3f3f3f;
	margin-left: 15px;
	}
.p2 {
	font-size: 16px;
	font-weight: 700;
	color: #3f3f3f;
	margin-left: 30px;
	}
.p3 {
	font-size: 16px;
	font-weight: 700;
	color: #3f3f3f;
	margin-left: 35px;
	}
	.myinfo-img {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	margin-bottom: 10px;
	}
	
	.pw-btn {
	border: 2px solid #4e73df;
	border-radius: 0.7em;
	background-color: #4e73df;
	color: #FFF;
	padding: 4px 5px 4px 5px;
	margin-left: 4px;
	}
	
	.pw-btn:hover {
	color: #FFF;
	text-decoration: none;
	}
	
	.attendance {
	margin-top: 50px;
	margin-left: 30px;
	}

.p4 {
	font-size: 24px;
	font-weight: 700;
	color: #3f3f3f;
	}
	
.p5 {
	font-size: 16px;
	color: #3f3f3f;
	}

.p6 {
	font-size: 16px;
	color: #3f3f3f;
	}
	
.in-btn {
	border: 2px solid #4e73df;
	border-radius: 0.7em;
	background-color: #4e73df;
	color: #FFF;
	padding: 4px 5px 4px 5px;
	}

.out-btn {
	border: 2px solid #CFD2CF;
	border-radius: 0.7em;
	background-color: #CFD2CF;
	color: #FFF;
	padding: 4px 5px 4px 5px;
	}
	
/* 캘린더 */
.cal {
	position: relative;
	bottom: 500;
	left: 230;
	margin-top:30px;
	}

.calendar {
	font-size: 14px;
	color: #3f3f3f;
	width: 660px;
	}
	
.date {
	position: relative;
	bottom: 1000;
	left: 910;
	
	border: 2px solid #4e73df;
	border-radius: 0.7em;
	background-color: #4e73df;
	color: #FFF;
	width: 280px;
	font-size: 14px;
	font-weight: 700;
	}

	.information {
	position: relative;
	bottom: 1000;
	left: 910;
	}
	
	.infor-table {
	margin-top: 20px;
	margin-right: 50px;
	border-radius: 0.7em;
	background-color: #4e73df;
	font-size: 14px;
	color: #FFF;
	width: 280px;
	}
}

</style>
</head>
  

<script> 
	$(function() {
		$(".mode-change").click(function() {
			location.href = "${pageContext.request.contextPath}/";
		});
		//풀캘린더
		var calendarEl = $('#calendar')[0];
		// full-calendar 생성하기
		var reservationStaffId = $("[name=reservationStaffId]").val();
		var calendar = new FullCalendar.Calendar(calendarEl, {
			aspectRatio : 1.2, //달력의 가로 세로 비율 설정
			// height: '500px', // calendar 높이 설정
			expandRows : true, // 화면에 맞게 높이 재설정
			// 해더에 표시할 툴바
			headerToolbar : {
				left : 'prev',
				center : 'title',
				right : 'next'
			},
			navLinkDayClick : function(date, jsEvent) {
				// console.log(date.toString()); //Sat Dec 03 2022 00:00:00 GMT+0900 (한국 표준시) 형태로 출력됨
				var reservationDate = moment(date).format('YYYY-MM-DD');
				//console.log(reservationDate); //2022-12-03 형식으로 변경
				$(".reservationDate").text(reservationDate);
				var calendarDate = $(".reservationDate").text();
				data = {
					reservationDate : reservationDate,
					reservationStaffId : reservationStaffId,
				}
				$
						.ajax({
							url : "http://localhost:8888/rest/calendar/"
									+ reservationDate,
							method : "get",
							date : data,
							success : function(resp) {
								//console.log(resp);
								var tbody = $(".ajax-content");
								$(".ajax-content").empty();
								if (resp.length > 0) {
									for (var i = 0; i < resp.length; i++) {
										var tr = $("<tr>").attr("class",
												"table-default align-middle");
										var td1 = $("<td>").text(
												resp[i].reservationStaffId);
										var td2 = $("<td>").text(
												resp[i].reservationContent);
										var td3 = $("<td>").text(
												resp[i].reservationDate);
										var td4 = $("<td>").text(
												resp[i].reservationNo);
										var td5 = $("<td>").text(
												resp[i].reservationTime);
										var td6 = $("<td>");
										tr.append(td1).append(td2).append(td3)
												.append(td4).append(td5)
												.append(td6);
										tbody.append(tr);
									}
								} else {
									var tr = $("<tr>").attr("class",
											"table-default align-middle");
									var td = $("<td>").attr("colspan", "6")
											.text('예약이 없습니다');
									tr.append(td);
									tbody.append(tr);
								}
							}
						});
			},
			themeSystem : 'bootstrap5',
			navLinks : true,
			editable : false,
			initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
			//initialDate: '2022-12-13', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
			nowIndicator : true, // 현재 시간 마크
			dayMaxEvents : false, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
			locale : 'ko', // 한국어 설정
			events : [ $.ajax({
				url : "http://localhost:8888/rest/calendar/",
				method : "get",
				data : reservationStaffId,
				success : function(resp) {
					//console.log(resp);	
					if (resp.length != 0) {
						for (var i = 0; i < resp.length; i++) {
							//console.log(resp[i]);		 	   
							calendar.addEvent({
								title : resp[i]['reservationStaffId'],
								start : resp[i]['reservationDate'] + 'T'
										+ resp[i]['reservationTime'],
								id : resp[i]['reservationNo']
							})
						}
					}
				}
			}) ]
		});
		// 캘린더 랜더링
		calendar.render();
	});
</script>
<body>
        
        <div class="myinfo">
		<p class="p1">내 정보</p>
		<img src="/attachment/download/staff?attachmentNo=${attachmentNo}"
			class="myinfo-img">
		<p class="p2">${staffDto.staffName}</p>
		<p class="p3">${staffDto.staffMedicalDepartment}</p>
		<a class="pw-btn" href="/staff/password">비밀번호 변경</a>
	</div>

	<div class="attendance">
		<p class="p4">근태관리</p>
		<!-- 퇴근 시간은 따로 ftm 있어야 함   -->
		<p class="p5" id="startList">
			출근시간 :
		</p>
		<p class="p6" id="endList">퇴근시간 : </p>
		<button class="in-btn" data-bs-toggle="modal"
			data-bs-target="#modal01" id="goWork">
			<strong>출근</strong>
		</button>
		<button class="out-btn" data-bs-toggle="modal"
			data-bs-target="#modal02" id="leaveWork">
			<strong>퇴근</strong>
		</button>
	</div>

	<div class="cal">
		<div class="calendar" id="calendar"></div>
	        
	</div>

	<div class="date">
		<span class="select-font">날짜 : </span> <span
			class="reservationDate select-font green"></span>
	</div>

	<div class="information">
		<table class="infor-table">
			<thead>
				<tr>
					<th>예약환자</th>
					<th>증상</th>
					<th>예약날짜</th>
					<th>예약번호</th>
					<th>방문시간</th>
				</tr>
			</thead>
			<tbody class="ajax-content">
				<!-- 비동기화 목록 출력 -->
			</tbody>
		</table>
	</div>


	<!-- 비동기화 출력을 위해 필요한 데이터 -->
	<input type="hidden" name="reservationStaffId"
		value="${staffDto.staffId}">

	<!-- Modal -->
	<div class="modal fade" id="modal01" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- 모달 헤더 : 제목 영역 -->
				<div class="modal-header">
					<h5 class="modal-title">Modal title</h5>

					<!-- x 버튼 -->
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<!-- 모달 바디 : 사용자에게 알려줄 내용 영역 -->
				<div class="modal-body">출근환영~</div>
				<!-- 모달 푸터 : 버튼들이 위치한 영역 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>

				</div>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="modal02" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- 모달 헤더 : 제목 영역 -->
				<div class="modal-header">
					<h5 class="modal-title">Modal title</h5>

					<!-- x 버튼 -->
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<!-- 모달 바디 : 사용자에게 알려줄 내용 영역 -->
				<div class="modal-body">퇴근~</div>
				<!-- 모달 푸터 : 버튼들이 위치한 영역 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>

				</div>
			</div>
		</div>

	</div>
	
	<script>
		$(function() {
			timeList();
			//출근함수
			$("#goWork").click(function() {
				var data = {
					attendanceStaffId : "${loginId}"
				}
				$.ajax({
					type : "post",
					url : "http://localhost:8888/rest/attendance",
					contentType : "application/json",
					data : JSON.stringify(data),
					success : function() {
						$("#modal01").modal("show");
						timeList();
					}
				});
			});
			//퇴근함수
			$("#leaveWork").click(function() {
				var data = {
					attendanceStaffId : "${loginId}"
				}
				$.ajax({
					type : "put",
					url : "http://localhost:8888/rest/attendance",
					contentType : "application/json",
					data : JSON.stringify(data),
					success : function() {
						$("#modal02").modal("show");
						timeList();
					}
				});
			});
			function timeList() {
				var id = "${loginId}";
				$.ajax({
					url : "http://localhost:8888/rest/attendance/" + id,
					method : "get",
					success : function(resp) {
						//console.log(resp);
						if (resp.startTime != null) {
							$("#startList").text("출근시간 : " + resp.startTime)
						} else {
							$("#startList").text("아직 출근전입니다.")
						}
						if (resp.endTime != null) {
							$("#endList").text("퇴근시간 : " + resp.endTime)
						} else {
							$("#endList").text("아직 퇴근전입니다.")
						}
						// for(var i=0;i<resp.length;i++){
						//     $("#timeList").text(JSON.stringify(resp[i]))
						// }
					}
				})
			}
		});
	</script>

</body>

</html>