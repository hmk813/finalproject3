<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="수술환자목록" name="title" />
</jsp:include>
      <link rel="preconnect" href="https://fonts.googleapis.com">
       <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
       <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
       <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
       
       <!-- Bootstrap CSS -->
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
          
          <link href="<c:url value="../css/sb-admin-2.min.css" />" rel="stylesheet">
          <link href="../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
      <style>
      .sp1{
      color:#3f3f3f;
      font-size:24px;
      font-weigth:700;
      }
      
      </style>
      <body id="page-top">
      <span class="sp1">수술 환자 목록</span>
      <div class="operation-list">
      </div>
      
      <span class="sp1">수술 환자 상세</span>
      <div class="operation-detail">
      
      </div>
      <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
      <script>
      $(function(){
         
         // 수술 환자 목록 불러와라 
         loadList();
         
         let operationList = [];
         
         hospitalizeLi
         // 수술 환자 목록 조회 
         function loadList(){
            $.ajax({
               url:"${pageContext.request.contextPath}/rest/operationlist",
               method:"get",
               dataType:"json",
               success: function(resp){
                  operationList = resp;// resp 별칭으로 붙여준다. 
                  showList();// 수술 환자 목록을 보여줌 
               }
            });
         };
         
         // 수술 환자 목록 출력 
         function showList(){
            $(".operation-list").empty();
            $.each(operationList, function(index, patient){
               var tag = $("<div>").text(patient.patientNo + " / " + patient.patientName);
               var button = $("<button>").text("상세").attr("data-patient-no", patient.patientNo);
               button.click(function(){
                  var patientNo = $(this).data("patient-no");
                  showDetail(patientNo);
               });
               tag.append(button);
               $(".operation-list").append(tag);
            });
         };
         
         function showDetail(patientNo) { 
            $.ajax({
               url:"${pageContext.request.contextPath}/rest/operationlist/"+patientNo,
               method:"get",
               success:function(resp) {
                  if(!resp) {//증상 정보가 없는 경우 - 없다는 표시를 추가하면 된다
                     $(".operation-detail").html("증상정보없음");
                  }
                  else {//증상 정보가 있는 경우 - resp를 이용해서 태그를 만들어서 추가하면 된다
                     $(".operation-detail").html("증상정보발견");
                  }
               }
            })
         }
         
         
         //마지막 
      });
      
      </script>   
     <%--  <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>입원번호</th>
                                            <th>환자명</th>
                                            <th>성별</th>
                                            <th>나이</th>
                                            <th>환자 주소</th>
                                            <th>병명</th>
                                            <th>수술일</th>
                                            <th>수술명</th>
                                            <th>입원일</th>
                                            <th>퇴원일</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <tr>
                                            <td>${hospitalizeVO	.hospitalizeNo}</td>
                                            <td>${hospitalizeVO.patientName}</td>
                                            <td>${hospitalizeVO.patientGender}</td>
                                            <td>${hospitalizeVO.patientBirth}</td>
                                            <td>${hospitalizeVO.patientAddress}</td>
                                            <td>${hospitalizeVO.diagnosisTitle}</td>
                                            <td>${hospitalizeVO.operationStartDay}</td>
                                            <td>${hospitalizeVO.operationTitle}</td>
                                            <td>${hospitalizeVO.hospitalizeStartDate}</td>
                                            <td>${hospitalizeVO.hospitalizeEndDate}</td> 
                                        </tr>
                                    </tbody>
						</table> --%>
      </body>