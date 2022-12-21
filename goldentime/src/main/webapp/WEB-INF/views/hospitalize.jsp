<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
   <jsp:param value="수술환자목록" name="title" />
</jsp:include>
	<head>
		<link rel="preconnect" href="https://fonts.googleapis.com">
	    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
	    
	    <!-- Bootstrap CSS -->
  	  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<link href="<c:url value="../css/sb-admin-2.min.css" />" rel="stylesheet">
  	  	 <link href="../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
		<style>
		
		</style>
	  	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
		<script>
		$(function(){
			
			loadList();
			
			let hospitalizeList = [];
			function loadList(){
				$.ajax({
						url:"${pageContext.request.contextPath}/rest/hospitalizelist",
						method:"get",
						dataType:"json",
						success:function(resp){
							hospitalizeList = resp; 
							showList();
						}
				});
			};
			
			function showList(){
				$(".hospitalize-list").empty();
				$.each(hospitalizeList, function(index, value){
					var tag = $("<div>").text(value.patientNo + "/" + value.patientName);
					var button = $("<button>").text("상세").attr("data-patient-no", value.patientNo);
					button.click(function(){
						var patientNo = $(this).data("patient-no");
						showDetail(patientNo);
					});
					tag.append(button)
					$("hospitalize-list").append(tag);
				});
			};
			
			//마지막 
		});
		
</script>	
<body id="page-top">
   <span class="sp1">입퇴원 환자 목록</span>
      <div class="hospitalize-list">
      </div>
      
      <span class="sp1">입퇴원 환자 상세</span>
      <div class="hospitalize-detail">
      
      </div>

</body>
	</head>
