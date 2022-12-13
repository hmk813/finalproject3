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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootswatch CDN -->
    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.0.2/cosmo/bootstrap.min.css">

    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
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
                    <div class="col-md-10 offset-md-1 p-4">
                        <h1 class="text-center">내 연차 조회</h1>
                    </div>
                </div>

                <div class="row mt-4">
                    <div class="col-md-10 offset-md-1">
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                            data-bs-target="#exampleModal" data-bs-whatever="@mdo">
                            연차신청하기
                        </button>
                    </div>
                </div>

                <div class="row mt-4">
                    <div class="col-md-10 offset-md-1">
                        <table class="table table-hover">
                            <thead class="text-center">
                                <tr class="bg-dark text-light">
                                    <th>휴가 번호</th>
                                    <th>아이디</th>
                                    <th>휴가 유형</th>
                                    <th>휴가 날짜</th>
                                    <th>휴가 일수</th>
                                    <th>휴가 내용</th>
                                    <th>휴가 신청 상태</th>
                                    <th>직원 등급</th>
                                    <th>직원 부서</th>
                                </tr>
                            </thead>
                            <tbody id="list" class="text-center">

                            </tbody>
                        </table>
                    </div>
                </div>

            </div>

            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">연차 신청하기</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form class="enroll">
                                <div class="mb-3">
                                    *휴가종류
                                </div>

                                <div class="mb-3">
                                    <select name="aaa" id="bbb">
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
                                            ● 총 휴가 일수 13일
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
                                    <label for="message-text" class="col-form-label">신청사유</label>
                                    <textarea class="form-control" id="message-text"></textarea>
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

            <!-- jquery cdn -->
            <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                crossorigin="anonymous"></script>


            <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
            <script>
                $(function () {
                    vacationList();


                    $(".vacation").click(function (e) {


                        var vacationStartDate = $("[name=vacationStartDate]").val();
                        var aaa=$("#bbb  option:selected").val();
                        console.log(vacationStartDate, aaa);


                    });

                    //휴가 목록함수
                    function vacationList() {
                        var id = "admin";
                        $.ajax({
                            url: "http://localhost:8888/rest/vacation/" + id,
                            method: "get",
                            success: function (resp) {

                                console.log(resp.length);
                                console.log(resp[resp.length - 1].staffLeaveCnt);


                                var useCnt = 0;
                                $("#list").empty();
                                for (var i = 0; i < resp.length; i++) {
                                    var tr = $("<tr>").attr("data-vacationNo", resp[i].vacationNo)
                                        .attr("data-vacationStaffId", resp[i].vacationStaffId)
                                        .attr("data-vacationType", resp[i].vacationType)
                                        .attr("data-vacationStartDate", resp[i].vacationStartDate)
                                        .attr("data-vacationDay", resp[i].vacationDay)
                                        .attr("data-vacationRecode", resp[i].vacationRecode)
                                        .attr("data-vacationState", resp[i].vacationState)
                                        .attr("data-staffGrade", resp[i].staffGrade)
                                        .attr("data-departmentName", resp[i].departmentName);

                                    var vacationNo = $("<td>").text(resp[i].vacationNo);
                                    var vacationStaffId = $("<td>").text(resp[i].vacationStaffId);
                                    var vacationType = $("<td>").text(resp[i].vacationType);
                                    var vacationStartDate = $("<td>").text(resp[i].vacationStartDate);
                                    var vacationDay = $("<td>").text(resp[i].vacationDay);
                                    var vacationRecode = $("<td>").text(resp[i].vacationRecode);
                                    var vacationState = $("<td>").text(resp[i].vacationState);
                                    var staffGrade = $("<td>").text(resp[i].staffGrade);
                                    var departmentName = $("<td>").text(resp[i].departmentName);

                                    tr.append(vacationNo);
                                    tr.append(vacationStaffId);
                                    tr.append(vacationType);
                                    tr.append(vacationStartDate);
                                    tr.append(vacationDay);
                                    tr.append(vacationRecode);
                                    tr.append(vacationState);
                                    tr.append(staffGrade);
                                    tr.append(departmentName);


                                    useCnt += resp[i].vacationDay;

                                    $("#list").append(tr);

                                }
                                $("#useCnt").append(useCnt);
                                $("#leaveCnt").append(resp[resp.length - 1].staffLeaveCnt);

                                $("#leaveCnt1").html('<i>● 남은 휴가 일수 &nbsp&nbsp</i>')
                                $("#leaveCnt1").append(resp[resp.length - 1].staffLeaveCnt);
                                $("#leaveCnt1").append('<i> 일 </i>')
                            }
                        });
                    }
                });
            </script>
</body>

</html>