<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="now" class="java.util.Date" />

<jsp:include page="/WEB-INF/views/template/mypageHeader.jsp">
	<jsp:param value="마이페이지" name="title" />
</jsp:include>
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

        .aa-flex {
            display: flex;
            flex-direction: row;
            flex-wrap: wrap
        }

        .w-75 {
            width: 75%;
        }

        .w-25 {
            width: 25%;
        }

        select {
            width: 300px;
            padding: 5px;
            border: 1px solid #999;
            border-radius: 3px;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
        }

        select::-ms-expand {
            display: none;
        }

        .circleSize {
            font-size: 3px;
        }
    </style>



</head>

<body>
    <div class="container-fluid">


        <div class="row mt-4 p-1">
            <div class="col">
                <h4>
                    <i class="fa-solid fa-circle-info"></i>
                    직원 휴가 현황
                </h4>
            </div>
        </div>



        <div class="row p-3">
            <div class="col">
                <table class="table tbl paginated table-hover " id="tbl">
                    <thead class="text-center">
                        <tr class="bg-dark text-light">
                            <th>부서</th>
                            <th>직책</th>
                            <th>이름</th>
                            <th>유형</th>
                            <th>날짜</th>
                            <th>휴가 기간</th>
                            <th>휴가 신청 상태</th>
                            <th>사유 보기</th>
                            <th>승인/반려</th>

                        </tr>
                    </thead>
                    <tbody id="list" class="text-center">

                    </tbody>
                </table>
            </div>
        </div>



        <!-- Modal -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
            aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable  ">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">휴가 사유</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>




        <!-- jquery cdn -->
        <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

        <script>
            $(function () {
                vacationList();

                

                //휴가 목록함수
                function vacationList() {

                    $.ajax({
                        url: "http://localhost:8888/admin/vacation",
                        cache: false,
                        data : $("form[name=search-form]").serialize(),
                        method: "get",
                        headers: { "cache-control": "no-cache" },
                        success: function (resp) {


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
                                    .attr("data-vacationRecode", resp[i].vacationRecode);

                                //console.log(resp);

                                var vacationNo = $("<td>").text(resp[i].vacationNo);
                                var staffMedicalDepartment = $("<td>").text(resp[i].staffMedicalDepartment);
                                var staffGrade = $("<td>").text(resp[i].staffGrade);
                                var staffName = $("<td>").text(resp[i].staffName);
                                var vacationType = $("<td>").text(resp[i].vacationType);
                                var vacationStartDate = $("<td>").text(resp[i].vacationStartDate);
                                var vacationDay = $("<td>").text(resp[i].vacationDay + "일");
                                var vacationState = $("<td>").text(resp[i].vacationState);
                                var vacationRecode = $("<td>").text(resp[i].vacationRecode);

                                var reason = '<td><button type="button" class="reason btn btn-outline-primary btn-sm btn-group" data-bs-toggle="modal" data-bs-target="#staticBackdrop">사유보기</button> </td>'
                                var btn = '<td><button type="button" class="approve btn btn-outline-primary btn-sm btn-group">승인</button> <button type="button" class="refuse btn btn-outline-danger btn-sm btn-group">반려</button></td>'



                                tr.append(staffMedicalDepartment);
                                tr.append(staffGrade);
                                tr.append(staffName);
                                tr.append(vacationType);
                                tr.append(vacationStartDate);
                                tr.append(vacationDay);
                                tr.append(vacationState);
                                tr.append(reason);
                                tr.append(btn);

                                $("#list").append(tr);

                                page();

                            }

                            $(".approve").click(function (e) {
                                e.stopPropagation();//전파 중지
                                var vacationNo = $(this).parent().parent().data("vacationno");

                                //console.log(vacationNo);

                                $.ajax({
                                    url: "http://localhost:8888/admin/vacation/" + vacationNo,
                                    method: "put",
                                    success: function (resp) {
                                        confirm("승인처리되었습니다.")
                                        vacationList();
                                    }
                                });


                            });

                            $(".refuse").click(function (e) {
                                e.stopPropagation();//전파 중지
                                var vacationNo = $(this).parent().parent().data("vacationno");

                                //console.log(vacationNo);

                                $.ajax({
                                    url: "http://localhost:8888/admin/vacation1/" + vacationNo,
                                    method: "put",
                                    success: function (resp) {
                                        confirm("반려처리되었습니다.")
                                        vacationList();
                                    }
                                });
                            });


                            $(".reason").click(function (e) {
                                e.stopPropagation();//전파 중지
                                var reason = $(this).parent().parent().data("vacationrecode");
                                console.log(reason);

                                $(".modal-body").text(reason);


                            });



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