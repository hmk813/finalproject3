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
	  
		<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
		
		<script>

		$(function(){
			
			// 수술 환자 목록 & 수술 환자 상세 목록 불러와라 
			loadList();
			loadDetail();
			
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
				$.each(operationList, function(index, value){
					var list = $("<table>").text(value.patientNo + "/" + value.patientName+"/"+value.diagnosisTitle);
					$(".operation-list").append(list);
				});
			};
			
			//수술 환자 상세 목록 조회 
 			let operationDetail=[];
			function loadDetail(){
				$.ajax({
					url:"${pageContext.request.contextPath}/rest/operationlist", //patientNo 를 인식 못하는데 무슨 문제 ㅡㅡ;;
					method:"get",
					dataType:"json",
					success: function(resp){
						operationDetail = resp; //resp 별칭을 붙여준다. 
						showDetail(); // 수술 환자 상세 목록을 보여준다.
					}
				});
			};

			
			// 수술 환자 목록을 클릭했을 때 
			$(document).on("click", ".operation-list", function(){
				$(".operation-detail").empty();
				$.ajax({
					url:"${pageContext.request.contextPath}/rest/operationlist"+patientNo, //patientNo 를 인식 못하는데 무슨 문제 ㅡㅡ;;
					method:"get",
					dataType:"json",
					success: function(resp){
						operationDetail = resp;
						showDetail();
					}
				});
			});
			
			//수술 환자 상세 목록 출력
			function showDetail(){
				$.each(operationDetail, function(index, value){
					var patientNo = $("<span>").text(value.diagnosisTitle)
					.attr("data-patient", value.patientNo);
				});
			}
			
			//마지막 
		});
   
		
		
		</script>	
		<body id="page-top">
		
		<span class="sp1">수술 환자 목록</span>
		<div class="operation-list">
		</div>
		
		<span class="sp1">수술 환자 상세</span>
		<div class="operation-detail">
		</div>

		</body>