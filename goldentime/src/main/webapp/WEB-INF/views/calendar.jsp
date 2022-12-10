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
    <meta charset='utf-8' />

    <!-- Bootstrap CSS -->
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css' rel='stylesheet'>
    <link href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css' rel='stylesheet'>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js">
	</script>


    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js'></script>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <script>

        $(function () {
            var calendarEl = $('#calendar')[0];
            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth', //캘린더 화면
                dateClick: function (info) { //날짜 클릭 시
                    console.log('Date: ' + info.dateStr);
                    $("#modal01").modal("show");
                },

                eventClick: function (event) { //이벤트 클릭 시
                    console.log(event);
                    $("#modal01").modal("show");
                    console.log("제목 : " + event.event.title);
                    console.log("날짜 : " + event.event.startStr);
                    console.log("날짜(시간포함) : " + event.event.start);
                },
                themeSystem: 'bootstrap5',
                selectable: true, // 날짜 선택
                locale: 'ko', // 한국어 설정
                // navLinks: true, // 날짜 선택하면 해당 날짜 화면
                editable: true, // 수정 가능 여부
                events: [
                    {
                        title: '테스트',
                        start: '2022-12-05T12:55'
                    }
                ]

                

                // events:function(info, successCallback, failureCallback){
                //     $.ajax({
                //         url:"",
                //         dataType:"json",
                //         method:"post",
                //     });
                // }


            });

            calendar.render();
        });
    </script>
</head>

<body>
    <div>
        <div id='calendar'></div>
        <div class="modal fade" id="modal01" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- 모달 헤더 : 제목 영역 -->
                    <div class="modal-header">
                        <h5 class="modal-title">예약 접수</h5>

                        <!-- x 버튼 -->
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <!-- 모달 바디 : 사용자에게 알려줄 내용 영역 -->
                    <div class="modal-body">
                        <input class="input" type="text" />
                        
                    </div>
                    <!-- 모달 푸터 : 버튼들이 위치한 영역 -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary">예약</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
 <div style="width:600px;"id="calendar"></div>     
</html>