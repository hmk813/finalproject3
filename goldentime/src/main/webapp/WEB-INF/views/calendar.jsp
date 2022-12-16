<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>

<head>
    <meta charset='utf-8' />

    <!-- Bootstrap CSS -->
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css' rel='stylesheet'>
    <link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css' rel='stylesheet'>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js">
	</script>


    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js'></script>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>

<head>

    <style>
        #calendar {
            max-width: 800px;
            margin: 70 auto;
            position:relative;
            left:200px;
        }
        .radio-time-color{
            opacity:0.5;
        }
        .bi-clock{
            color: blue;
        }
        
    </style>
    <meta charset='utf-8' />

    <!-- Bootstrap CSS -->
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css' rel='stylesheet'>
    <link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css' rel='stylesheet'>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js'></script>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <script>

        $(function () {
            var calendarEl = $('#calendar')[0];
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth', //캘린더 화면
                dateClick: function (info) { //날짜 클릭 시
                    // console.log('Date: ' + info.dateStr);
                    var date = info.dateStr;
                    $.ajax({
                    	url:"http://localhost:8888/rest/reservation/"+date,
                    	method:"get",
                    	success:function(resp){
                    		if(resp != null){
                    			reservationDate = resp;
                    		}
                    	}                	
                    });
                    
                   /*  $.ajax({ // 해당 날짜의 예약 목록 불러오기
                        url:"http://localhost:8888/rest/reservation/"+date,
                        method:"get",
                        success:function(resp){
                            if(resp != null){
                                reservationDate = resp;
                            }
                        }
                    }); */
                },

                eventClick: function (event) { //이벤트 클릭 시

                },
                themeSystem: 'bootstrap5',
                selectable: true, // 날짜 선택
                locale: 'ko', // 한국어 설정
                // navLinks: true, // 날짜 선택하면 해당 날짜 화면
                editable: true, // 수정 가능 여부

                events: [
                    // 하루에 예약이 3개 이상이면 예약 n건으로 출력
                ]


            });

            calendar.render();

        });
    </script>
</head>

<body>
    <div>
        <div id='calendar'></div>
	</div>
</body>

</html>