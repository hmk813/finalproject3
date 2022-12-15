<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>


    <script src="https://kit.fontawesome.com/188e96ed37.js" crossorigin="anonymous"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <!-- Bootstrap CDN -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>






</head>

<body>
    <div class="container-fluid">



        <div class="row mt-4">
            <div class="col-md-10 offset-md-1">
                <table style="border:1px solid black;">
                    <thead>
                        <tr>
                            <th>총 연차</th>
                            <th>사용 연차</th>
                            <th>남은 연차</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>13</td>
                            <td id="useCnt"></td>
                            <td id="leaveCnt"></td>
                        </tr>
                    </tbody>
                </table>




                <div class="row mt-4">
                    <div class="col-6 col-md-4">
                        <h4 class="text-center">내 휴가 현황</h4>
                    </div>
                </div>

                <div class="row mt-4">
                    <div class="col-md-10 offset-md-1">
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#enroll"
                            data-bs-whatever="@mdo">
                            연차신청하기
                        </button>
                    </div>
                </div>

                <div class="row mt-4">
                    <div class="col-md-10 offset-md-1">
                        <table class="table ">
                            <thead class="text-center">
                                <tr class="bg-dark text-light">
                                    <th>번호</th>
                                    <th>부서</th>
                                    <th>직책</th>
                                    <th>이름</th>
                                    <th>유형</th>
                                    <th>날짜</th>
                                    <th>휴가 기간</th>
                                    <th>휴가 신청 상태</th>
                                    <th>수정/삭제</th>
                                </tr>
                            </thead>
                            <tbody id="list" class="text-center">

                            </tbody>
                        </table>
                    </div>
                </div>

            </div>

            <!--휴가 신청하기-->
            <div class="modal fade" id="enroll" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">휴가 신청하기</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form class="enroll">
                                <div class="mb-3">
                                    *휴가종류
                                </div>

                                <div class="mb-3">
                                    <select id="vacationType">
                                        <option>선택해주세요.</option>
                                        <option value="연차">연차</option>
                                        <option value="월차">월차</option>
                                        <option value="반차">반차</option>
                                        <option value="출산">출산</option>
                                    </select>
                                </div>
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-8 col-sm-6">
                                            <i>● 총 휴가 일수 13 일</i>
                                        </div>
                                        <div class="col-4 col-sm-6" id="leaveCnt1">
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-3">
                                    *휴가일
                                </div>
                                <div class="mb-3">
                                    <input type="date" name="vacationStartDate">
                                </div>

                                <div class="mt-3">
                                    *휴가 일수
                                </div>
                                <div class="mb-3">
                                    <input type="number" name="vacationDay">
                                </div>

                                <div class="mb-3">
                                    <label for="message-text" class="col-form-label">사유</label>
                                    <textarea class="form-control" id="message-text" name="vacationRecode"></textarea>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                            <button type="submit" class="btn btn-primary vacation">신청하기</button>
                        </div>
                    </div>
                </div>
            </div>


            <!--휴가 수정하기-->
            <div class="modal fade" id="edit" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">휴가 수정하기</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form class="enroll">
                                <div class="mb-3">
                                    *휴가종류
                                </div>

                                <div class="mb-3">
                                    <select id="vacationType1">
                                        <option>선택해주세요.</option>
                                        <option value="연차">연차</option>
                                        <option value="월차">월차</option>
                                        <option value="반차">반차</option>
                                        <option value="출산">출산</option>
                                    </select>
                                </div>

                                <div class="mt-3">
                                    *휴가일
                                </div>
                                <div class="mb-3">
                                    <input type="date" name="vacationStartDate1">
                                </div>

                                <div class="mt-3">
                                    *휴가 일수
                                </div>
                                <div class="mb-3">
                                    <input type="number" name="vacationDay1">
                                </div>

                                <div class="mb-3">
                                    <label for="message-text" class="col-form-label">사유</label>
                                    <textarea class="form-control" id="message-text" name="vacationRecode1"></textarea>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                            <button type="submit" class="btn btn-primary vacation1">수정하기</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- jquery cdn -->
            <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

            <script>
                $(function () {
                    vacationList();

                    //휴가를 신청하는 버튼 이벤트 처리
                    $(".vacation").click(function (e) {
                        var vacationStartDate = $("[name=vacationStartDate]").val();
                        var vacationRecode = $("[name=vacationRecode]").val();
                        var vacationDay = $("[name=vacationDay]").val();
                        var vacationType = $("#vacationType  option:selected").val();

                        console.log(vacationStartDate, vacationType, vacationDay, vacationRecode);

                        var data = {
                            vacationStaffId: "test2",
                            vacationStartDate: $("[name=vacationStartDate]").val(),
                            vacationRecode: $("[name=vacationRecode]").val(),
                            vacationDay: $("[name=vacationDay]").val(),
                            vacationType: $("#vacationType  option:selected").val()
                        };

                        $.ajax({
                            url: "http://localhost:8888/rest/vacation",
                            method: "post",
                            contentType: "application/json",
                            data: JSON.stringify(data),
                            success: function () {

                                console.log("성공");
                                $("#enroll").modal("hide");

                                $("[name=vacationRecode]").val("");
                                $("[name=vacationDay]").val("");
                                $("[name=vacationStartDate]").val("");
                                $("#vacationType").val("");
                                vacationList();
                            }
                        });
                    });



                    //휴가 목록함수
                    function vacationList() {
                        var id = "test2";
                        $.ajax({
                            url: "http://localhost:8888/rest/vacation/" + id,
                            method: "get",
                            success: function (resp) {

                                //console.log(resp.length);
                                //console.log(resp[resp.length - 1].vacationStartDate);


                                var useCnt = 0;
                                $("#list").empty();
                                for (var i = 0; i < resp.length; i++) {
                                    var tr = $("<tr>").attr("data-vacationNo", resp[i].vacationNo)
                                        .attr("data-staffMedicalDepartment", resp[i].staffMedicalDepartment)
                                        .attr("data-staffGrade", resp[i].staffGrade)
                                        .attr("data-vacationStaffId", resp[i].vacationStaffId)
                                        .attr("data-vacationType", resp[i].vacationType)
                                        .attr("data-vacationStartDate", resp[i].vacationStartDate)
                                        .attr("data-vacationDay", resp[i].vacationDay)
                                        .attr("data-vacationState", resp[i].vacationState)

                                    //console.log(resp);

                                    var vacationNo = $("<td>").text(resp[i].vacationNo);
                                    var staffMedicalDepartment = $("<td>").text(resp[i].staffMedicalDepartment);
                                    var staffGrade = $("<td>").text(resp[i].staffGrade);
                                    var staffName = $("<td>").text(resp[i].staffName);
                                    var vacationType = $("<td>").text(resp[i].vacationType);
                                    var vacationStartDate = $("<td>").text(resp[i].vacationStartDate);
                                    var vacationDay = $("<td>").text(resp[i].vacationDay + "일");
                                    var vacationState = $("<td>").text(resp[i].vacationState);

                                    
                                    var btn = '<td><button type="button" class="edit btn btn-outline-primary btn-sm btn-group">수정</button><button type="button" class="del btn btn-outline-danger btn-sm btn-group">삭제</button></td>'

                                    // edit.data("target");
                                    // edit.toggle("modal");
                                    $(".edit").click(function (e) {
                                        e.stopPropagation();//전파 중지
                                        $("#edit").modal("show");
                                        var vacationNo = $(this).parent().parent().data("vacationno");
                                        
                                        //console.log("몇번이냐고!!" + vacationNo);
                                        $(".vacation1").click(function (e) {
                                            e.stopPropagation();//전파 중지
                                            var vacationStartDate = $("[name=vacationStartDate1]").val();
                                            var vacationRecode = $("[name=vacationRecode1]").val();
                                            var vacationDay = $("[name=vacationDay1]").val();
                                            var vacationType = $("#vacationType1  option:selected").val();
                                            var vacationNo1 = vacationNo;

                                            console.log(vacationStartDate, vacationType, vacationDay, vacationRecode, vacationNo1);

                                            var data = {
                                                vacationStaffId: "test2",
                                                vacationStartDate : $("[name=vacationStartDate1]").val(),
                                                vacationRecode : $("[name=vacationRecode1]").val(),
                                                vacationDay : $("[name=vacationDay1]").val(),
                                                vacationType : $("#vacationType1  option:selected").val(),
                                                vacationNo : vacationNo1
                                            };

                                            $.ajax({
                                                url: "http://localhost:8888/rest/vacation",
                                                method: "put",
                                                contentType: "application/json",
                                                data: JSON.stringify(data),
                                                success: function () {

                                                    console.log("성공");
                                                    $("#edit").modal("hide");

                                                    $("[name=vacationRecode]").val("");
                                                    $("[name=vacationDay]").val("");
                                                    $("[name=vacationStartDate]").val("");
                                                    $("#vacationType").val("");
                                                    vacationList();
                                                }
                                            });
                                        });

                                    });



                                    

                                    tr.append(vacationNo);
                                    tr.append(staffMedicalDepartment);
                                    tr.append(staffGrade);
                                    tr.append(staffName);
                                    tr.append(vacationType);
                                    tr.append(vacationStartDate);
                                    tr.append(vacationDay);
                                    tr.append(vacationState);
                                    tr.append(btn);

                                    useCnt += resp[i].vacationDay;

                                    $("#list").append(tr);

                                }
                                //console.log("useCnt" + useCnt);
                                $("#useCnt").append(useCnt);
                                $("#leaveCnt").append(resp[resp.length - 1].staffLeaveCnt - useCnt);

                                $("#leaveCnt1").html('<i>● 남은 휴가 일수 &nbsp&nbsp</i>')
                                $("#leaveCnt1").append(resp[resp.length - 1].staffLeaveCnt - useCnt);
                                $("#leaveCnt1").append('<i> 일 </i>')
                            }
                        });
                    }
                });
            </script>
</body>

</html>