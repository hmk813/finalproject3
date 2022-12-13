<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <html>
	<head>
		<link rel="preconnect" href="https://fonts.googleapis.com">
	    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
	    
	    <!-- Bootstrap CSS -->
  	  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  	  	
		<style>
		
		</style>
	  	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
		<script>
/* 		$(function(){
			//  수술 환자 목록 상세 숨김 
			$(".show-operation-list").hide();
			$(".operation-list").click(function(){
				$(".show-operation-list").toggle();
			});
		});		 */

		$(function(){
			// 수술 환자 목록 상세 숨김 
			$(".show-operation-list").hide();
			
			//수술 환자 클릭시 
			$(".operation-list").click(function(){
				$.ajax({
					url:"http://localhost:8888/rest/operationlist",
					method:"get",
					success:function(resp){
					/* 	$(".show-operation-list").toggle(resp); */
						
					// 수술 환자 클릭시 그 수술 환자의 상세 목록이 나오게 하기 
					if(resp)
						$.each(resp, function(index, item){
							//수술환자 번호 = 수술환자 번호가 똑같은 경우에 그 환자만 보여준다. 
							if(item.operation == item.operation){  // 하 이거 아닌거 같은데...
							$(".show-operation-list").show();
							}
						});
					}
				
				});
			});
		});
		
		
		</script>	
	<body id="page-top">
		        <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Tables</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">수술 환자 목록</h6>
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
                                  
                                    <tbody class="operation-list">
                                  <c:forEach var="opertaionVO" items="${operationInformationVO}" >
									<tr>
										<td>${opertaionVO.patientNo}</td>
										<td>${opertaionVO.patientName}</td>
										<td>${opertaionVO.diagnosisTitle}</td>
									</tr>
									</c:forEach>
                                    </tbody>
                                </table>

                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>환자번호</th>
                                            <th>환자명</th>
                                            <th>나이</th>
                                            <th>성별</th>
                                            <th>혈액형</th>
                                            <th>수술번호</th>
                                            <th>수술방</th>
                                            <th>수술시작시간</th>
                                            <th>수술종료시간</th>
                                        </tr>
                                    </thead>
                                  
                                    <tbody  class="show-operation-list">
                                      <c:forEach var="opertaionListVO" items="${operationInformationVO}" >
									<tr>
										<td>${opertaionListVO.patientNo}</td>
										<td>${opertaionListVO.patientName}</td>
										<td>${opertaionListVO.patientBirth}</td>
										<td>${opertaionListVO.patientGender}</td>
										<td>${opertaionListVO.patientBlood}</td>
										<td>${opertaionListVO.operationNo}</td>
										<td>${opertaionListVO.operationNo}</td>
										<td>${opertaionListVO.operationRoomNo}</td>
										<td>${opertaionListVO.operationStartDay}</td>
										<td>${opertaionListVO.operationEnd}</td>
									</tr>
									</c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

		</body>
	</head>
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	</html>