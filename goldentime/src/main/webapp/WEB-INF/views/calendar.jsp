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
   <!DOCTYPE html>
<html lang='ko'>

<head>

    <style>
        #calendar {
            max-width: 800px;
            margin: 0 auto;
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
            var staff; // 직원 객체를 저장할 변수
            var patient; // 환자 객체를 저장할 변수
            var patientNo; // 환자 번호를 저장할 변수
            var reservation; // 예약 객체를 저장할 변수

            $.ajax({ // 의사 출력
                url: "http://localhost:8888/rest/staff",
                method: "get",
                success: function (resp) {
                    if (resp != null) {
                        staff = resp;
                        for (var i = 0; i < staff.length; i++) {
                            // console.log(staff[i].staffDepartmentNo);
                            // console.log(staff[i].staffId);
                            if (staff[i].staffDepartmentNo == 1) {
                                // 예약 날짜와 직원 번호로 예약자 3명 이상인지 확인
                                $(".doctor-reservation-select").append($("<option>").append(staff[i].staffMedicalDepartment + "-" + staff[i].staffName).addClass("reservation-option").val(staff[i].staffId));
                            }
                        }
                    } else {
                        console.log("실패");
                    }
                }
            });

            $.ajax({ // 환자 출력
                url: "http://localhost:8888/rest/patient",
                method: "get",
                success: function (resp) {
                    if (resp != null) {
                        patient = resp;
                    } else {
                        console.log("실패");
                    }
                }
            });

            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'dayGridMonth', //캘린더 화면
                dateClick: function (info) { //날짜 클릭 시
                    // console.log('Date: ' + info.dateStr);
                    var date = info.dateStr;
                    $("#modal01").modal("show"); //모달 도출
                    $(".modal-date").val(date); // 날짜 삽입
                    $(".symptom-modal-textarea").val(""); // 텍스트창 초기화
                    // console.log(staff);
                    $(".doctor-reservation-select").val($(".select-option").val()); // 의사 선택 초기화
                    $(".modal-patient").val(""); // 환자 텍스트창 초기화
                    for (var i = 0; i < $("[name=time]").length; i++) { // 시간 선택 아이콘 초기화
                        $("[name=time]").prev().removeClass("radio-time-color");
                        // console.log($(this).prev());
                    };
                    $("[name=time]").prop('checked', false); // 시간 선택 라디오 버튼 체크 해제
                },

                eventClick: function (event) { //이벤트 클릭 시
                    // console.log(event);
                    $("#modal02").modal("show"); //모달 도출
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
                    // 하루에 예약이 3개 이상이면 예약 n건으로 출력
                    $.ajax({
                        url: "http://localhost:8888/rest/reservation",
                        method: "get",
                        success: function (resp) {
                            if (resp != null) {
                                console.log(resp);
                                reservation = resp;
                                for(var i = 0; i < reservation.length; i++){
                                    calendar.addEvent({
                                        title: reservation[i]['reservationStaffId'],
                                        start: reservation[i]['reservationDate']+'T'+reservation[i]['reservationTime']
                                    })
                                }
                            } else {
                                console.log("실패");
                            }
                        }
                    })
                ]


            });

            calendar.render();

            $(".doctor-reservation-select").change(function () {
                // 여기에 해당 의사가 예약이 몇개인지 그리고 시간때를 불러온다
                // 3개 이하일 때 예약된 시간을 비활성화 시키고 출력
                // console.log($(".doctor-reservation-select").val());
                for(var i = 0; i < reservation.length; i++){ // 선택한 의사가 예약 테이블에 있을 때
                    if($(".doctor-reservation-select").val() == reservation[i].reservationStaffId){
                        // console.log(reservation[i].reservationStaffId);
                        console.log(reservation[i].reservationTime); // 예약 시간 확인
                        // console.log($("[name=time]:checked").val());
                        if(reservation[i].reservationTime == $("[name=time]").val()){
                            console.log("확인");
                        }
                        
                    }
                }
            });
            $(".modal-patient").blur(function () {
                var patientJudg;
                var patientOne;
                for(var i = 0; i < patient.length; i++){
                    patientJudg = $(".modal-patient").val() == patient[i].patientName;
                    if(patientJudg){
                        // console.log($(".modal-patient").val());
                        patientOne = patient[i];
                        break;
                    }
                }
                // console.log(patientJudg);
                if (patientOne != null) {
                    // console.log(patientOne.patientNo); //인풋 히든으로
                    patientNo = patientOne.patientNo;
                }
            });
            $("[name=time]").change(function () {
                for (var i = 0; i < $("[name=time]").length; i++) {
                    $("[name=time]").prev().removeClass("radio-time-color");
                    // console.log($(this).prev());
                };
                $(this).prev().addClass("radio-time-color");
                // console.log($(this).val());
                // console.log($(this).prev());
                // if(reservation[0].reservationTime == $(this).val()){
                //     console.log("확인");
                // }
            });

            $(".btn-reservation").click(function () {
                var data = {
                    reservationStaffId:$(".doctor-reservation-select").val(),
                    reservationPatientNo : patientNo,
                    reservationDate : $(".modal-date").val(),
                    reservationContent:$(".symptom-modal-textarea").val(),
                    reservationTime:$("[name=time]:checked").val()
                };
                console.log($(".doctor-reservation-select").val());
                console.log(patientNo);
                console.log($(".modal-date").val());
                console.log($(".symptom-modal-textarea").val());
                console.log($("[name=time]:checked").val());
                $.ajax({
                    url:"http://localhost:8888/rest/reservation",
                    method:"post",
                    contentType:"application/json",
                    data:JSON.stringify(data),
                    success:function(){
                        console.log("성공");
                        $('#modal01').modal('hide');
                        location.reload();
                    }
                });
            });
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
                        <label>예약일</label>
                        <input class="modal-date form-control" type="date">
                        <label>주치의</label>
                        <select class="form-control doctor-reservation-select">
                            <option class="select-option">선택</option>
                        </select>
                        <label>환자이름</label>
                        <input class="form-control modal-patient">
                        <label>시간 단위</label>
                        <div class="row">
                            <label class="col-3">
                                <i class="bi bi-clock"></i> 09:00
                                <input class="opacity-0" name="time" type="radio" value="09:00">
                            </label>
                            <label class="col-3">
                                <i class="bi bi-clock"></i> 10:00
                                <input class="opacity-0" name="time" type="radio" value="10:00">
                            </label>
                            <label class="col-3">
                                <i class="bi bi-clock"></i> 11:00
                                <input class="opacity-0" name="time" type="radio" value="11:00">
                            </label>
                            <label class="col-3">
                                <i class="bi bi-clock"></i> 13:00
                                <input class="opacity-0" name="time" type="radio" value="13:00">
                            </label>
                            <label class="col-3">
                                <i class="bi bi-clock"></i> 14:00
                                <input class="opacity-0" name="time" type="radio" value="14:00">
                            </label>
                            <label class="col-3">
                                <i class="bi bi-clock"></i> 15:00
                                <input class="opacity-0" name="time" type="radio" value="15:00">
                            </label>
                            <label class="col-3">
                                <i class="bi bi-clock"></i> 16:00
                                <input class="opacity-0" name="time" type="radio" value="16:00">
                            </label>
                            <label class="col-3">
                                <i class="bi bi-clock"></i> 17:00
                                <input class="opacity-0" name="time" type="radio" value="17:00">
                            </label>
                        </div>
                        <label>증상</label>
                        <textarea style="resize: none;" class="form-control symptom-modal-textarea" rows="5"></textarea>
                    </div>
                    <!-- 모달 푸터 : 버튼들이 위치한 영역 -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary btn-reservation">예약</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="modal02" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- 모달 헤더 : 제목 영역 -->
                    <div class="modal-header">
                        <h5 class="modal-title">예약 확인</h5>

                        <!-- x 버튼 -->
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <!-- 모달 바디 : 사용자에게 알려줄 내용 영역 -->
                    <div class="modal-body">

                    </div>
                    <!-- 모달 푸터 : 버튼들이 위치한 영역 -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary">확인</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>