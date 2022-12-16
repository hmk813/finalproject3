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



    <style>
        .box1 {
            display: inline-block;
            /* default값 inline */

            border: 1px solid skyblue;
            /* 테두리 */

            color: #2E64FE
                /* 글자색 : white */
        }

        .box2 {
            display: inline-block;
            /* default값 inline */

            background-color: #2E64FE;

            border: 1px solid #2E64FE;
            /* 테두리 */

            color: white;
                /* 글자색 : white */
        }

        span:hover {
            background: #E6E6E6;
        }

        .aa-flex{
            display: flex;
            flex-direction: row;
            flex-wrap:wrap

        }
        .w-75{
            width: 75%;
        }
        .w-25{
            width: 25%;
        }
    </style>



</head>

<body>
    <div class="container-fluid">


        <div class="row mt-4 p-3">
            <div class="col">
                <h4>나의 휴가 현황</h4>
            </div>
        </div>
        <div class="row p-3">
            <div class="col p-2">
                <div class="border rounded shadow p-2">
                <table class="table table-striped">
                    <thead class="text-center">
                        <tr>
                            <th>총 연차</th>
                            <th>사용 연차</th>
                            <th>남은 연차</th>
                        </tr>
                    </thead>
                    <tbody class="text-center">
                        <tr>
                            <td>13</td>
                            <td id="useCnt"></td>
                            <td id="leaveCnt"></td>
                        </tr>
                    </tbody>
                </table>
                </div>
            </div>
            <div class="col p-2">
                <div class="border rounded shadow p-2">
                <table class="table table-striped">
                    <thead class="text-center">
                        <tr>
                            <th>총 월차</th>
                            <th>사용 월차</th>
                            <th>남은 월차</th>
                        </tr>
                    </thead>
                    <tbody class="text-center">
                        <tr>
                            <td id="dayoff"></td>
                            <td id="useCnt1"></td>
                            <td id="usedayoff"></td>
                        </tr>
                    </tbody>
                </table>
                </div>
            </div>
        </div>  

        

                <div class="d-flex bd-highlight p-3">
                    <div class="p-3 bd-highlight">
                        <h4 class="text-left">나의 휴가 신청/사용 내역</h4>
                    </div>
                    <div class="ms-auto p-2 bd-highlight">
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#enroll"
                            data-bs-whatever="@mdo">
                            연차신청하기
                        </button>
                    </div>
                </div>

                <div class="row p-3">
                    <div class="col">
                        <table class="table tbl paginated table-hover " id="tbl">
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
                                            <i>● 총 연차 일수 13 일</i>
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

                       // console.log(vacationStartDate, vacationType, vacationDay, vacationRecode);

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

                                //console.log("성공");
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
                            cache: false,
                            method: "get",
                            headers: { "cache-control": "no-cache" },
                            success: function (resp) {

                                var useCnt = 0;//연차
                                var useCnt1 = 0;//월차
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


                                    var btn = '<td><button type="button" class="edit btn btn-outline-primary btn-sm btn-group">수정</button> <button type="button" class="del btn btn-outline-danger btn-sm btn-group">삭제</button></td>'


                                    $(".del").click(function (e) {
                                        e.stopPropagation();
                                        var vacationNo = $(this).parent().parent().data("vacationno");


                                        //console.log(vacationNo);
                                        $.ajax({
                                            url: "http://localhost:8888/rest/vacation/" + vacationNo,
                                            method: "delete",
                                            success: function (resp) {
                                                vacationList();
                                            }
                                        });


                                    });

                                    $(".edit").click(function (e) {
                                        e.stopPropagation();//전파 중지
                                        $("#edit").modal("show");
                                        var vacationNo = $(this).parent().parent().data("vacationno");

                                        $(".vacation1").click(function (e) {
                                            e.stopPropagation();//전파 중지
                                            var vacationStartDate = $("[name=vacationStartDate1]").val();
                                            var vacationRecode = $("[name=vacationRecode1]").val();
                                            var vacationDay = $("[name=vacationDay1]").val();
                                            var vacationType = $("#vacationType1  option:selected").val();
                                            var vacationNo1 = vacationNo;

                                            //console.log(vacationStartDate, vacationType, vacationDay, vacationRecode, vacationNo1);

                                            var data = {
                                                vacationStaffId: "test2",
                                                vacationStartDate: $("[name=vacationStartDate1]").val(),
                                                vacationRecode: $("[name=vacationRecode1]").val(),
                                                vacationDay: $("[name=vacationDay1]").val(),
                                                vacationType: $("#vacationType1  option:selected").val(),
                                                vacationNo: vacationNo1
                                            };

                                            $.ajax({
                                                url: "http://localhost:8888/rest/vacation",
                                                method: "put",
                                                contentType: "application/json",
                                                data: JSON.stringify(data),
                                                success: function () {

                                                   // console.log("성공");
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
                                    

                                    if(resp[i].vacationType=="연차"){
                                        useCnt += resp[i].vacationDay;
                                    }else if(resp[i].vacationType=="월차"){
                                        useCnt1 += resp[i].vacationDay;
                                    }else{
                                        return 0;
                                    }

                                    $("#list").append(tr);

                                }
                                //console.log("useCnt" + useCnt);
                                $("#useCnt").text(useCnt);
                                $("#leaveCnt").text(resp[resp.length - 1].staffLeaveCnt - useCnt);
                                
                                $("#useCnt1").text(useCnt1);
                                $("#usedayoff").text(resp[resp.length - 1].staffDayoff - useCnt1);
                                $("#dayoff").text(resp[resp.length - 1].staffDayoff);


                                $("#leaveCnt1").html('<i>● 남은 연차 일수 &nbsp&nbsp</i>')
                                $("#leaveCnt1").append(resp[resp.length - 1].staffLeaveCnt - useCnt);
                                $("#leaveCnt1").append('<i> 일 </i>')
                                page();
                            }
                        });
                    }

                    function page() {

                        var reSortColors = function ($table) {
                            $('tbody tr:odd td', $table).removeClass('even').removeClass('listtd').addClass('odd');
                            $('tbody tr:even td', $table).removeClass('odd').removeClass('listtd').addClass('even');
                        };
                        $('table.paginated').each(function () {
                            var pagesu = 10;  //페이지 번호 갯수
                            var currentPage = 0;
                            var numPerPage = 10;  //목록의 수
                            var $table = $(this);

                            //length로 원래 리스트의 전체길이구함
                            var numRows = $table.find('tbody tr').length;
                            //Math.ceil를 이용하여 반올림
                            var numPages = Math.ceil(numRows / numPerPage);
                            //리스트가 없으면 종료
                            if (numPages == 0) return;
                            //pager 만들기 전에 remo 존재 여부 확인 있으면 삭제
                            if ($("#remo")) {
                                $("#remo").remove();
                            }
                            //pager라는 클래스의 div엘리먼트 작성
                            var $pager = $('<td align="center" id="remo" colspan="10"><div class="pager"></div></td>');

                            var nowp = currentPage;
                            var endp = nowp + 10;

                            //페이지를 클릭하면 다시 셋팅
                            $table.bind('repaginate', function () {
                                //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다

                                $table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
                                $("#remo").html("");

                                if (numPages > 1) {     // 한페이지 이상이면
                                    if (currentPage < 5 && numPages - currentPage >= 5) {   // 현재 5p 이하이면
                                        nowp = 0;     // 1부터 
                                        endp = pagesu;    // 10까지
                                    } else {
                                        nowp = currentPage - 5;  // 6넘어가면 2부터 찍고
                                        endp = nowp + pagesu;   // 10까지
                                        pi = 1;
                                    }

                                    if (numPages < endp) {   // 10페이지가 안되면
                                        endp = numPages;   // 마지막페이지를 갯수 만큼
                                        nowp = numPages - pagesu;  // 시작페이지를   갯수 -10
                                    }
                                    if (nowp < 1) {     // 시작이 음수 or 0 이면
                                        nowp = 0;     // 1페이지부터 시작
                                    }
                                } else {       // 한페이지 이하이면
                                    nowp = 0;      // 한번만 페이징 생성
                                    endp = numPages;
                                }
                                // [처음]
                                $('<br /><span class="page-number box1" cursor: "pointer"><i class="fa-solid fa-angles-left"></i></span>').bind('click', { newPage: page }, function (event) {
                                    currentPage = 0;
                                    $table.trigger('repaginate');
                                    $($(".page-number")[2]).addClass('active').siblings().removeClass('active');
                                }).appendTo($pager).addClass('clickable');
                                // [이전]
                                $('<span class="page-number box1 px-1" cursor: "pointer"><i class="fa-solid fa-angle-left"></i></span>').bind('click', { newPage: page }, function (event) {
                                    if (currentPage == 0) return;
                                    currentPage = currentPage - 1;
                                    $table.trigger('repaginate');
                                    $($(".page-number")[(currentPage - nowp) + 2]).addClass('active').siblings().removeClass('active');
                                }).appendTo($pager).addClass('clickable');
                                // [1,2,3,4,5,6,7,8]
                                for (var page = nowp; page < endp; page++) {
                                    $('<span class="page-number box1 px-3 py-1" cursor: "pointer" ></span>').text(page + 1).bind('click', { newPage: page }, function (event) {
                                        currentPage = event.data['newPage'];
                                        $table.trigger('repaginate');
                                        $($(".page-number")[(currentPage - nowp) + 2]).addClass('active').siblings().removeClass('active');
                                    }).appendTo($pager).addClass('clickable');
                                }
                                // [다음]
                                $('<span class="page-number box1  px-1" cursor: "pointer"><i class="fa-solid fa-angle-right"></i></span>').bind('click', { newPage: page }, function (event) {
                                    if (currentPage == numPages - 1) return;
                                    currentPage = currentPage + 1;
                                    $table.trigger('repaginate');
                                    $($(".page-number")[(currentPage - nowp) + 2]).addClass('active').siblings().removeClass('active');
                                }).appendTo($pager).addClass('clickable');
                                // [끝]
                                $('<span class="page-number box1  px-1" cursor: "pointer"><i class="fa-solid fa-angles-right"></i></span>').bind('click', { newPage: page }, function (event) {
                                    currentPage = numPages - 1;
                                    $table.trigger('repaginate');
                                    $($(".page-number")[endp - nowp + 1]).addClass('active').siblings().removeClass('active');
                                }).appendTo($pager).addClass('clickable');

                                $($(".page-number")[2]).addClass('active');
                                reSortColors($table);
                            });
                            $pager.insertAfter($table).find('span.page-number:first').next().next().addClass('active');
                            $pager.appendTo($table);
                            $table.trigger('repaginate');
                        });
                    }

                });
            </script>
</body>

</html>