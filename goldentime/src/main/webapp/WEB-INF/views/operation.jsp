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
      margin-left: 200px;
      }
      .sp2{
	  color:#3f3f3f;
      font-size:24px;
      font-weigth:700;
      margin-left: 200px;
      }
      .div1{
      margin-top: 10px;
      margin-left: 200px;
      color: #3f3f3f;
      border: 1px solid #4e73df;
      border-radius: 0.7em;
      background-color: #4e73df;
      color: #FFF;
      width: 160px;
      height: 30px;
      }
      .detail-btn{
      margin-left: 10px;
       border: 1px solid #4e73df;
       border-radius: 0.7em;
       background-color: #4e73df;
       color: #FFF;
      }
      .div2{
      position: relative;
      left:450;
      bottom: 3238;
      }
      .div3{
      margin-top: 10px;
      margin-left: 170px;
      position: relative;
      left:450;
      bottom: 3238;
      }
      .oper-list{
      color: #3f3f3f;
      }
      .info-box{
      border: 1px solid #4e73df;
      border-radius: 0.7em;
      width: 300px;
      height: 30px;
      }
      </style>


      <body>
	<span class="sp1">수술 환자 목록</span>
		<div class="operation-list"></div>

	<div class="div2">
    	  <span class="sp2">수술 환자 상세</span>
	</div>
	<div class="div3">
      	<form class="detail-view">
      	<label class="lab"> 환자명
			<input type="text" name="patientName" class="info-box" >
      	</label>
      	<br>
      	<label class="lab2">성&nbsp;&nbsp;&nbsp;별
			<input type="text" name="patientGender" class="info-box" >
      	</label>
      	<br>
      	<label class="lab"> 혈액형 
			<input type="text" name="patientBlood"  class="info-box">
		</label>
		<br>
      	<label class="lab"> 생년월일
			<input type="text" name="patientBirth"  class="info-box">
		</label>
	</form>	
     </div>
     
      <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

      <script>
      $(function(){
         
         // 수술 환자 목록 불러와라 
         loadList();
         
         let operationList = [];

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
               var tag = $("<div>").text(patient.patientNo + " - " + patient.patientName);
               tag.addClass("div1"); // 클래스 이름 추가 
               var button = $("<button>").text("click!").attr("data-patient-no", patient.patientNo);
               button.addClass("detail-btn");
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
            	   var test = $(".h3");
					console.log("resp"+resp);
					
                  if(!resp) {//증상 정보가 없는 경우 - 없다는 표시를 추가하면 된다
                     $("[name=patientName]").val("");
                     $("[name=patientGender]").val("");
                     $("[name=patientBlood]").val("");
                     $("[name=patientBirth]").val("");
                  }
                  else {//증상 정보가 있는 경우 - resp를 이용해서 태그를 만들어서 추가하면 된다
                	  $("[name=patientName]").val(resp.patientName);
                      $("[name=patientGender]").val(resp.patientGender);
                      $("[name=patientBlood]").val(resp.patientBlood);
                      $("[name=patientBirth]").val(resp.patientBirth);
                  }
               }
            })
         }
         
         //마지막 
      });
      </script>   
		

		
	<div class="list-view">	
    </div>
      
      </body>