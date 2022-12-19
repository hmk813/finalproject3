<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />

<jsp:include page="/WEB-INF/views/template/mypageHeader.jsp">
   <jsp:param value="마이페이지" name="title" />
</jsp:include>


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
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
 html, body{
            margin:0;
            padding:0;
        }

        main, header, aside, section, footer, nav, div {
            border:1px;
        }
        main {
            width: 800px;
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
        
		.calendar {
		position:relative;
		top:5%;
		bottom:10%;
		left:10%;
		max-width:600px;
		margin: 0 auto;
	}	
	
	.profile-box {
    width: 20%;
    height: 200px;
    background: white;
    border-radius: 10px;
    position: absolute;
    left: 300px;
    top: 150px;
}

	.profile-picture {
    margin-top: 20px;
    text-align: center;
	}
	
	.att-box{ /* 근태박스 */
	position:absolute;
	bottom:30%;
	left:20%;
	border-radius:10px;
	width:20%;
	height:200px;
	transform:translate(-10%,30%);
	
	
	}
</style>
</head>
<script>
$(function(){      
      $(".mode-change").click(function(){
         location.href="${pageContext.request.contextPath}/";
      });
     
      
      //풀캘린더
      var calendarEl = $('#calendar')[0];
         // full-calendar 생성하기
         var reservationStaffId = $("[name=reservationStaffId]").val();
         var calendar = new FullCalendar.Calendar(calendarEl, {
           aspectRatio: 1.2, //달력의 가로 세로 비율 설정
          // height: '500px', // calendar 높이 설정
           expandRows: true, // 화면에 맞게 높이 재설정
           // 해더에 표시할 툴바
           headerToolbar: {
             left: 'prev',
             center: 'title',
             right: 'next'
           },
           navLinkDayClick: function (date, jsEvent) {
              // console.log(date.toString()); //Sat Dec 03 2022 00:00:00 GMT+0900 (한국 표준시) 형태로 출력됨
              var reservationDate = moment(date).format('YYYY-MM-DD');
              console.log(reservationDate); //2022-12-03 형식으로 변경
               $(".reservationDate").text(reservationDate);
               
               var calendarDate = $(".reservationDate").text();
               
               data={
                   	reservationDate:reservationDate,
                    reservationStaffId:reservationStaffId,
               }
               
               $.ajax({
                  url:"http://localhost:8888/rest/calendar/"+reservationDate,
                  method:"get",
                  date:data,
                  success:function(resp){
                    console.log(resp);
                    var tbody = $(".ajax-content");
                     $(".ajax-content").empty();
                    if(resp.length>0){
                       for(var i=0; i<resp.length; i++){ 
                          var tr =  $("<tr>").attr("class","table-default align-middle"); 
                          var td1 = $("<td>").text(resp[i].reservationStaffId);
                          var td2 = $("<td>").text(resp[i].reservationContent);
                          var td3 = $("<td>").text(resp[i].reservationDate);
                          var td4 = $("<td>").text(resp[i].reservationNo);
                          var td5 = $("<td>").text(resp[i].reservationTime);
                          var td6 = $("<td>");
                          tr.append(td1).append(td2).append(td3).append(td4).append(td5).append(td6);
                          tbody.append(tr);
                       }
                    }else{ 
                       var tr =  $("<tr>").attr("class","table-default align-middle");
                       var td = $("<td>").attr("colspan","6").text('예약이 없습니다');
                       tr.append(td);
                       tbody.append(tr);
                    } 
                  }
               });
           }, 
           themeSystem:'bootstrap5',
           navLinks: true,
           editable: false,
           initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
           //initialDate: '2022-12-13', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
           nowIndicator: true, // 현재 시간 마크
           dayMaxEvents: false, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
           locale: 'ko', // 한국어 설정
           events: [
              $.ajax({
                 url:"http://localhost:8888/rest/calendar/",
                 method:"get",
                 data:reservationStaffId,
                 success:function(resp){
                    console.log(resp);	
                   if(resp.length!=0){
                       for(var i=0; i<resp.length; i++){
                    	   //console.log(resp[i]);		 	   
                    	   calendar.addEvent({
                    		   title: resp[i]['reservationStaffId'],
                               start: resp[i]['reservationDate']+'T'+resp[i]['reservationTime'],
                               id : resp[i]['reservationNo']
                    	   })  
                   		}
                   }
                 }
              })
              ]
         });
         // 캘린더 랜더링
         calendar.render();
   });
</script>

<body>
	
	
	 <div class="main-box">
        <div class="profile-box">
            <div class="title-name">
                <h4>내정보</h4>
 
            </div>
            <div class="profile-picture">
                <img src="../image/test.jpg" style="width:200px;" class="img">
                
          	<div>이름 : ${staffDto.staffName}</div>
            <div>진료과 : ${staffDto.staffMedicalDepartment}</div>
             <div><a href="/staff/password">비밀번호 변경</a></div>
            </div>
        </div>
        
     
        <div class="att-box col text-center">
        	<div>근태관리</div>
        	<div>출근시간 : <fmt:formatDate value="${now}" pattern="a HH:mm:ss" var="now" />
									<c:out value="${now}" /></div> 
        	<div>퇴근시간 : </div>
        	
        	<!-- 질문할것 현재씨한테 -->
        	
        	<button type="button" class="btn btn-primary" onclick="location.href='${AttendanceWorkTimeVO.startTime}' ">출근</button>
        	<button type="button" class="btn btn-secondary" onclick="location.href='${AttedanceWorkTimeVO.endTime}' ">퇴근</button> 
        </div>
    </div>
    
    <!-- Modal -->
   <div class="modal fade" id="change-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
     <div class="modal-dialog">
       <div class="modal-content">
         <div class="modal-body">
         </div>
         <div class="modal-footer">
           <button type="button" class="btn btn-yellow mode-change" data-bs-dismiss="modal">확인</button>
         </div>
       </div>
     </div>
   </div>

   <div class="container-fluid">
   
        <div class="row mt-80">
            <div class="col-md-6 offset-md-3 col-sm-4 offset-sm-4 mt-4">
                 <div class="text-center">
                    <h3>마이페이지</h3>
                 </div>
            </div>
        </div>
 
       <div class="row mt-5">
            <div class="col-md-6 offset-md-3 col-sm-4 offset-sm-4">
                 <div class="text-center" id="calendar"></div>
                 <div class="text-center mt-2">
                 </div>
            </div>
        </div>
        
      <div class="row mt-5">
            <div class="col-md-6 offset-md-3 col-sm-4 offset-sm-4">
                 <div class="text-center">
                    <span class="select-font">날짜 : </span>
                    <span class="reservationDate select-font green"></span>
                 </div>
            </div>
        </div>
        
        <div class="row mt-5">
            <div class="col-md-6 offset-md-3 col-sm-4 offset-sm-4">
                 <div class="text-center">
                    <table class="table text-center">
                       <thead>
                          <tr class="align-middle calendar-table">
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
            </div>
        </div>
        
        <div class="row mt-3 mb-5">
            <div class="col-md-6 offset-md-3 col-sm-4 offset-sm-4">
                 <div class="text-center">
                 </div>
            </div>
        </div>
        
    </div>

  <!-- 비동기화 출력을 위해 필요한 데이터 -->
   <input type="hidden" name="reservationStaffId" value="${staffDto.staffId}">
   
			
			<div class="calendar" id="calendar">
		</div>   
   
</body>

</html>


