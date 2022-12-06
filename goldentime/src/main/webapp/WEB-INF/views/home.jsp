<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>

	<div class="container fluid">
		<div class="c-left">
			<div class="myInfo box">
				<span class="c-title">내 정보</span>
				
					<span class="material-icons" style="font-size: 80px;display: block;text-align: center">
							내정보
					</span>
				<div style="font-size:18px;">${loginUser.memberName } ${loginUser.rank }</div>
				<div style="color: rgba(90, 90, 90); font-size:16px">${loginUser.division }</div>
				<div class="info-list">
				</div>
			</div>
			<div class="attendance box">
				<span class="c-title">근태 관리</span>
				<div class="att-time">
					<div>
						출근 시간<span id="att-str"></span>
					</div>
					<div>
						퇴근 시간<span id="att-fin"></span>
					</div>
				</div>
				<div class="att-btn">
					<button id="attStr-btn">출근</button>
					<button id="attFin-btn">퇴근</button>
				</div>
			</div>
		</div>
		<div class="c-center">
			<div class="calendar" id="calendar">
			</div>
			<div class="calendar-detail box-t">
				<header id="cal-header"></header>
				<div class="cal-area">
					<table id="cal-table"></table>
				</div>
			</div>
		</div>
			<div class="notice box">
				<span class="c-title">공지사항</span>
				<ul>
						<li><a href="${nDetail }"><span>${notice.noticeTitle }</span></a></li>
				</ul>
			</div>
</body>




	
	
</body>
</html>