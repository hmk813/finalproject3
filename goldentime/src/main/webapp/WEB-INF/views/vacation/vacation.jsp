<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootswatch CDN -->
    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.0.2/cosmo/bootstrap.min.css">

    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
</head>

<body>

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

    <table style="border:1px solid black;">
        <thead>
            <tr>
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
        <tbody id="list" style="border:1px solid black;">
        </tbody>
    </table>


    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>


    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script>
        $(function () {
            vacationList();

            //휴가 목록함수
            function vacationList() {
                var id = "aaa";
                $.ajax({
                    url: "http://localhost:8888/rest/vacation/" + id,
                    method: "get",
                    success: function (resp) {

                        console.log(resp.length);
                        console.log(resp[resp.length-1].staffLeaveCnt);

                        
                       $("#leaveCnt").append(resp[resp.length-1].staffLeaveCnt);
                      
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

                               
                                useCnt+=resp[i].vacationDay;

                            $("#list").append(tr);

                        }
                        $("#useCnt").append(useCnt);
                    }
                });
            }
        });
    </script>
    </script>
</body>

</html>