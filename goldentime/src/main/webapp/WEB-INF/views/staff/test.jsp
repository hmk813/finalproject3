<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>


  <style>
        #calendar {
            max-width: 600px;
            margin: 0 auto;
        }
    </style>
    
    
<meta charset="UTF-8">
 <!-- Bootstrap CSS -->
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css' rel='stylesheet'>
    <link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css' rel='stylesheet'>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js">
	</script>


    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js'></script>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<script>
	
	document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
        	initialView: 'dayGridMonth'
        },
        
        selectable: true, // 날짜 선택
        locale: 'ko', // 한국어 설정
        // navLinks: true, // 날짜 선택하면 해당 날짜 화면
        editable: true, // 수정 가능 여부
        events: [
            {
                title: '테스트',
                start: '2022-12-09T17:28'
            }
        ]
        
        
        });
        
        
        calendar.render();
      });

	
	</script>
</head>



<body>
	
	
	
	
</body>

 <div style="width:600px;"id="calendar"></div>   
</html>