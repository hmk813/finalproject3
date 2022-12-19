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
			// 수술 환자 목록 상세 숨김 
			$(".show-hospitalize-list").hide();
			
			//수술 환자 클릭시 
			$(".hospitalize-list").click(function(){
				$.ajax({
					url:"http://localhost:8888/rest/hospitalizelist",
					method:"get",
					success:function(resp){
					// 수술 환자 클릭시 그 수술 환자의 상세 목록이 나오게 하기 
					if(resp)
						$.each(resp, function(index, item){
							//수술환자 번호 = 수술환자 번호가 똑같은 경우에 그 환자만 보여준다. 
							if(item.hospitalize == item.hospitalize){  // 하 이거 아닌거 같은데...
							$(".show-hospitalize-list").show();
							}
						});
					}
				 
				});
			});
		});
		
		</script>	
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>환자번호</th>
                                            <th>이름</th>
                                            <th>진단명</th>
                                        </tr>
                                    </thead>
                                  
                                    <tbody>
                                        <tr>
                                            <td>${hospitalizeVO.patientNo}</td>
                                            <td>${hospitalizeVO.patientName}</td>
                                            <td>${hospitalizeVO.operationContent}</td>
                                        </tr>
                                    </tbody>
                                </table>

                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
                                            <td>${hospitalizeVO.hospitalizeNo}</td>
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
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>


</body>
	</head>
