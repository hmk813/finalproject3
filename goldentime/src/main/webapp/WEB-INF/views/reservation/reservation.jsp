<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="예약" name="title"/>
</jsp:include>
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
        .disabled-button{
            display: none;
        }
        #time-reservation{
            color: red;
        }
        
        /* 디자인 */
        .calendar{
        width: 700px;
        height: 600px;
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
            var reservation; // 전체 예약 객체를 저장할 변수
            var reservationDate; // 하루 예약 객체를 저장할 변수
            var reservationNo; // 삭제를 위해 예약 번호 저장할 변수
            var date;

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
                headerToolbar: {
                    left: 'prev',
                    center: 'title',
                    right: 'next'
                },
                dateClick: function (info) { //날짜 클릭 시
                    // console.log('Date: ' + info.dateStr);
                    date = info.dateStr;
                    $("#modal01").modal("show"); //모달 도출
                    $(".modal-date").val(date); // 날짜 삽입
                    $.ajax({ // 해당 날짜의 예약 목록 불러오기
                        url:"http://localhost:8888/rest/reservation/"+date,
                        method:"get",
                        success:function(resp){
                            if(resp != null){
                                reservationDate = resp;
                            }
                        }
                    });
                    $("#time-reservation").text(" ");
                    $(".symptom-modal-textarea").val(""); // 텍스트창 초기화
                    // console.log(staff);
                    $(".doctor-reservation-select").val($(".select-option").val()); // 의사 선택 초기화
                    $(".modal-patient").val(""); // 환자 텍스트창 초기화
                    for (var i = 0; i < $("[name=time]").length; i++) { // 시간 선택 아이콘 초기화
                        $("[name=time]").prev().removeClass("radio-time-color");
                        // console.log($(this).prev());
                    };
                    $("[name=time]").each(function () {
                        $(this).parent().removeClass("disabled-button");
                    });
                    $("[name=time]").prop('checked', false); // 시간 선택 라디오 버튼 체크 해제
                },

                eventClick: function (event) { //이벤트 클릭 시
                    $("#modal02").modal("show"); //모달 도출
                    $.ajax({
                        url:"http://localhost:8888/rest/reservation/detail/"+event.event.id,
                        method:"get",
                        success:function(resp){
                            if(resp != null){
                                reservationNo = event.event.id;
                                $("#doctor-name-confirm").val(resp.reservationStaffId);
                                $("#reservation-date-confirm").val(resp.reservationDate);
                                $("#reservation-time-confirm").val(resp.reservationTime);
                                $("#reservation-patient-confirm").val(resp.reservationPatientNo);
                                $("#reservation-content-confirm").val(resp.reservationContent);
                            }
                            else{
                                console.log("실패");
                            }
                        }
                    });
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
                                // console.log(resp);
                                reservation = resp;
                                for(var i = 0; i < reservation.length; i++){
                                    calendar.addEvent({
                                        title: reservation[i]['reservationStaffId'],
                                        start: reservation[i]['reservationDate']+'T'+reservation[i]['reservationTime'],
                                        id : reservation[i]['reservationNo']
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
                // 현재 날짜와 직원아이디로 리스트 뽑아서 시간 비교
                // 시간과 라디오 버튼 벨류 값이랑 비교해서 같은 건 히든으로 숨기기
                // console.log($(".doctor-reservation-select").val());
                $("#time-reservation").text(" ");
                $("[name=time]").prop('checked', false); // 시간 선택 라디오 버튼 체크 해제
                $("[name=time]").each(function () {
                    $(this).parent().removeClass("disabled-button");
                });
                $.ajax({
                    url: "http://localhost:8888/rest/reservation/vo?reservationStaffId=" + $(".doctor-reservation-select").val() + "&reservationDate=" + date,
                    method: "get",
                    success: function (resp) {
                        if (resp != 0) {
                            if (resp.length < 3) {
                                for (var i = 0; i < resp.length; i++) {
                                    // console.log(resp[i].reservationTime);
                                    $("[name=time]").each(function () {
                                        // console.log($(this).val());
                                        if ($(this).val() == resp[i].reservationTime) {
                                            $(this).parent().addClass("disabled-button");
                                        }
                                    });
                                }
                            } else if (resp.length >= 3) {
                                $("[name=time]").each(function () {
                                    $(this).parent().addClass("disabled-button");
                                    $("#time-reservation").text("예약이 다찼습니다.");
                                });
                            }
                        }
                    }
                });
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
            });

            $(".btn-reservation-delete").click(function () {
                console.log(reservationNo);
                $.ajax({
                    url: "http://localhost:8888/rest/reservation/" + reservationNo,
                    method: "delete",
                    success: function () {
                        console.log("삭제완료");
                        $('#modal01').modal('hide');
                        location.reload();
                    }
                });
            });

            $(".btn-reservation").click(function () {
                var data = {
                    reservationStaffId:$(".doctor-reservation-select").val(),
                    reservationPatientNo : patientNo,
                    reservationDate : $(".modal-date").val(),
                    reservationContent:$(".symptom-modal-textarea").val(),
                    reservationTime:$("[name=time]:checked").val()
                };
                // console.log($(".doctor-reservation-select").val());
                // console.log(patientNo);
                // console.log($(".modal-date").val());
                // console.log($(".symptom-modal-textarea").val());
                // console.log($("[name=time]:checked").val());
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
        <div id='calendar' class="calendar"></div>
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
                            <span id="time-reservation"></span>
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
                        <label>주치의</label>
                        <input id="doctor-name-confirm" class="form-control bg-light mb-3" type="text" readonly>
                        <label>예약일</label>
                        <input id="reservation-date-confirm" class="form-control bg-light mb-3" type="text" readonly>
                        <label>예약시간</label>
                        <input id="reservation-time-confirm" class="form-control bg-light mb-3" type="text" readonly>
                        <label>환자</label>
                        <input id="reservation-patient-confirm" class="form-control bg-light mb-3" type="text" readonly>
                        <label>증상</label>
                        <input id="reservation-content-confirm" class="form-control bg-light mb-3" type="text" readonly>
                        
                    </div>
                    <!-- 모달 푸터 : 버튼들이 위치한 영역 -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger btn-reservation-delete">삭제</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>