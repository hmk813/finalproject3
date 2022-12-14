<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
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
<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="일정관리" name="title"/>
</jsp:include>
<style>
   a{
      color:black;
   }
   .fc .fc-button-primary{
      background-color:#81BDF1;
      border-color:#81BDF1;
   }
   .fc .fc-button-primary:hover{
      color: #fff;
      background-color: #3498db;
      border-color: #2980b9;
   }
   .fc .fc-button:focus{
      border-color:none;
      box-shadow: none;
   }
   .fc .fc-button-primary:not(:disabled):active:focus,
     .fc .fc-button-primary:not(:disabled).fc-button-active:focus {
       box-shadow: none;
     }
   .select-date{
      border:1px solid rgba(0, 0, 0, 0.1);
      width:95%;
      padding:0.5rem 1.1rem;
      outline:none;
      font-size:15px;
      border-radius: 0.5rem;
   }
   .margin-10{
      margin-left:10px;
      margin-right:10px;
   }
   .calendar-table{
      background-color:#f8c291;
      color:#2d3436;
   }
   table>tbody>tr>td{
      height:50px;
      vertical-align: middle;
   }
   .fc-scrollgrid{
      border-radius: 0.5rem;
   }
   .fc-theme-standard .fc-scrollgrid {
    border: 1px solid #fff;
  }
  
	  .calendar{
        width: 700px;
        font-size: 14px;
		color: #3f3f3f;
        }
        
   	.infor-table {
   		position: relative;
   		bottom: 460;
   		left: 780;
		border-radius: 0.7em;
		background-color: #4e73df;
		font-size: 14px;
		color: #FFF;
		width: 280px;
	}
	
	.date {
	position: relative;
	bottom: 480;
	left: 780;
	
	border: 2px solid #4e73df;
	border-radius: 0.7em;
	background-color: #4e73df;
	color: #FFF;
	width: 280px;
	font-size: 14px;
	font-weight: 700;
	}
	
</style>
<script>

   $(function(){      
      //회원모드로 전환 이벤트
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
                    //console.log(resp);	
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
   
   <div class="calendar">
		<div class="text-center" id="calendar"></div>
                 <div class="text-center mt-2">
        </div>
	</div>
        
                 <div class="date">
                    <span class="select-font">날짜 : </span>
                    <span class="reservationDate select-font green"></span>
                 </div>
        
                 <div class="text-center">
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
   <input type="hidden" name="reservationStaffId" value="${staffDto.staffId}">
   
</body>
</html>