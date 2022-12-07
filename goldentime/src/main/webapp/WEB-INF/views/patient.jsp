<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
		<script>
			$(function(){
				loadList();		
				
				//form 에 submit 이벤트를 설정해서 등록 처리
				$(".detail-view").submit(function(e){
					e.preventDefault();
					
					var data = $(this).serializeArray();
						
					$.ajax({
						url:"http://localhost:8888/rest/patient",
						method:"post",
						contentType:"application/json",
						data:data,
						success:function(){
							loadList();
						}
					});
				});
			});
				

			//목록을 불러오는 함수
			function loadList(){
				$.ajax({
					url:"http://localhost:8888/rest/patient",
					method:"get",
					success:function(resp){
						//console.log(resp);
						$(".list-view").empty();
						for(var i=0; i < resp.length; i++){
							var html = $("#data-template").html();
							html = html.replaceAll("{{patientName}}", resp[i].patientNo);
							html = html.replaceAll("{{patientBirth}}", resp[i].patientBirth);
							html = html.replaceAll("{{patientGender}}", resp[i].patientGender);
							
							var tag = $.parseHTML(html);
							$(tag).click(function(){
								var no = $(this).data("patientName");
								var name = $(this).data("patientBirth");
								var type = $(this).data("patientGender");
								$("[name=no]").val(no);
								$("[name=name]").val(name);
								$("[name=type]").val(type);
							});
							$(tag).find(".btn-delete").click(function(){
								if(confirm("정말 삭제하시겠습니까?")) {
									var no = $(this).data("no");
									deleteData(no);									
								}
							});
							
							$(".list-view").append(tag);
						}
					}
				});
			}
		</script>	
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-1000">
			<div class="row center">
				<h1>회원 접수</h1>
			</div>
			<form class="detail-view">
				<input name="patientName" type="text"  required><br><br>
				<input name="patientBirth" type="date" required><br><br>
				<input name="patientGender" type="text"  required><br><br>
				<input name="patientBlood" type="text" required><br><br>
				<input name="patientAddress" type="text"   required><br><br>
				<input name="patientPhone" type="tel"  required><br><br>
				<button type="submit">등록</button>
			</form>
			<div class="list-view">
			
			</div>
		</div>
		

</body>
</html>