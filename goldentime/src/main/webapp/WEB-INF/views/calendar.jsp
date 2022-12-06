<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
  <head>
    <meta charset='utf-8' />
    
<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css' rel='stylesheet'>
<link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css' rel='stylesheet'>
    
    <link href='fullcalendar/lib/main.css' rel='stylesheet' />
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src='fullcalendar/lib/main.js'></script>
    <script type="text/javascript">
  
    
	$(function(){
		getCalendarData("12");
	});
	function getCalendarData(month){
		$.ajax({
			url:"${pageContext.request.contextPath}/test/"+month,
			method:"post",
			data:"",
			success:function(data) {
				data = JSON.parse(data);
				console.log(data);
				var calendarEl = document.getElementById('calendar');
		        var calendar = new FullCalendar.Calendar(calendarEl, {
		        	/* timeZone: 'local',
	        	 	initialDate: '2022-12-02', */
	        	 	/*  initialView: 'dayGridMonth',  */
	        	 	
	        	 	initialDate: '2022-12-02',
                    initialView: 'timeGridWeek',
                    headerToolbar: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                    },
		          locale:"ko",
		          events:data,
		          eventClick:function(info){
		        	  console.log(info.event.startStr);
		        	  popupData(info.event.startStr);
		          }
		        });
		       	
		        calendar.render();
			},
			error:function(){
				
			}
			});
	}
	
	function popupData(date){
		$.ajax({
			url:"${pageContext.request.contextPath}/popupdata/"+date,
			method:"post",
			data:"",
			success:function(data) {
				data = JSON.parse(data);
				console.log(data);
				//modal show
				
				
			},
			error:function(){
				
			}
			});
	}
	
	
</script>
 <style>
 <body>
 
 
  </body>
</style>
 <div style="width:600px;"id="calendar"></div>     
</html>