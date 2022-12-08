<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js'></script>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <script>

        $(function () {
            var calendarEl = $('#calendar')[0];
            var staff;
            var patient;
            $.ajax({ // 의사 출력
                url: "http://localhost:8888/rest/staff",
                method: "get",
                success: function (resp) {
                    if (resp != null) {
                        staff = resp;
                        for (var i = 0; i < staff.length; i++) {
                            // console.log(staff[i].staffDepartmentNo);
                            // console.log(staff[i].staffId);
                            if(staff[i].staffDepartmentNo == 1){
                                $(".doctor-reservation-select").append($("<option>").append(staff[i].staffMedicalDepartment+"-"+staff[i].staffName).addClass("reservation-option").val(staff[i].staffId));
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
                    $(".modal-text").val(""); // 텍스트창 초기화
                    // console.log(staff);
                    $(".doctor-reservation-select").val($(".select-option").val());
                    $(".modal-patient").val("");
                    $("[name=time]").prop('checked', false);
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

                // events: [
                //     {
                //         title: '테스트',
                //         start: '2022-12-05'
                //     }
                // ]


                // events:function(info, successCallback, failureCallback){
                //     $.ajax({
                //         url:"",
                //         dataType:"json",
                //         method:"post",
                //     });
                // }


            });

            calendar.render();

            $(".doctor-reservation-select").change(function () {
                console.log($(".doctor-reservation-select").val());
            });
            $(".modal-patient").blur(function () {
                var patientJudg;
                var patientOne;
                for(var i = 0; i < patient.length; i++){
                    patientJudg = $(".modal-patient").val() == patient[i].patientName;
                    if(patientJudg){
                        console.log($(".modal-patient").val());
                        patientOne = patient[i];
                        break;
                    }
                }
                console.log(patientJudg);
                if(patientOne != null){
                    console.log(patientOne.patientNo); //인풋 히든으로
                }
            });

            $(".btn-reservation").click(function () {
                console.log("테스트");
            });
            $("[name=time]").change(function () {
                console.log($(this).val());
            });

        });
    </script>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                                <i class="bi bi-clock"></i> 01:00
                                <input class="opacity-0" name="time" type="radio" value="01:00">
                            </label>
                            <label class="col-3">
                                <i class="bi bi-clock"></i> 02:00
                                <input class="opacity-0" name="time" type="radio" value="02:00">
                            </label>
                            <label class="col-3">
                                <i class="bi bi-clock"></i> 03:00
                                <input class="opacity-0" name="time" type="radio" value="03:00">
                            </label>
                            <label class="col-3">
                                <i class="bi bi-clock"></i> 04:00
                                <input class="opacity-0" name="time" type="radio" value="04:00">
                            </label>
                            <label class="col-3">
                                <i class="bi bi-clock"></i> 05:00
                                <input class="opacity-0" name="time" type="radio" value="05:00">
                            </label>
                        </div>
                        <label>증상</label>
                        <textarea style="resize: none;" class="form-control modal-text" rows="5"></textarea>
                    </div>
                    <!-- 모달 푸터 : 버튼들이 위치한 영역 -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary btn-reservation">예약</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>