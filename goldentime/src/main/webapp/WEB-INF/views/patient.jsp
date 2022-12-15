<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	$(function() {
		loadList();
		
		//수정 버튼 클릭 이벤트
		$(".edit-btn").click(function(){
			var patientNo = $("[name=patientNo]").val();
			var patientName = $("[name=patientName]").val();
			var patientBirth = $("[name=patientBirth]").val();
			var patientGender = $("[name=patientGender]").val();
			var patientBlood = $("[name=patientBlood]").val();
			var patientAddress = $("[name=patientAddress]").val();
			var patientPhone = $("[name=patientPhone]").val();
			
			editData(patientNo, patientName, patientBirth, patientGender,
					patientBlood, patientAddress, patientPhone);
			
			$("[name=patientNo]").val("");
			$("[name=patientName]").val("");
			$("[name=patientBirth]").val("");
			$("[name=patientGender]").val("");
			$("[name=patientBlood]").val("");
			$("[name=patientAddress]").val("");
			$("[name=patientPhone]").val("");
		});
		
		//form 에 submit 이벤트를 설정해서 등록 처리
		$(".detail-view").submit(function(e){
			e.preventDefault();
			
			var patientNo = $("[name=patientNo]").val();
			var patientName = $("[name=patientName]").val();
			var patientBirth = $("[name=patientBirth]").val();
			var patientGender = $("[name=patientGender]").val();
			var patientBlood = $("[name=patientBlood]").val();
			var patientAddress = $("[name=patientAddress]").val();
			var patientPhone = $("[name=patientPhone]").val();
			
			//검사
			saveData(patientNo, patientName, patientBirth, patientGender,
					patientBlood, patientAddress, patientPhone);
			
			$("[name=patientNo]").val();
			$("[name=patientName]").val();
			$("[name=patientBirth]").val();
			$("[name=patientGender]").val();
			$("[name=patientBlood]").val();
			$("[name=patientAddress]").val();
			$("[name=patientPhone]").val();
		});
	});
	
		//수정 함수
		function editData(patientNo, patientName, patientBirth, patientGender,
				patientBlood, patientAddress, patientPhone) {
			var data = {
					patientNo:patientNo,
					patientName:patientName,
					patientBirth:patientBirth,
					patientGender:patientGender,
					patientBlood:patientBlood,
					patientAddress:patientAddress,
					patientPhone:patientPhone
				};
		
			$.ajax({
				url:"http://localhost:8888/rest/patient",
				method:"put",
				contentType:"application/json",
				data:JSON.stringify(data),
				success:function(){
					loadList();
				}
			});
		};
	
		//환자 등록 함수
		function saveData(patientNo, patientName, patientBirth,patientGender,  patientBlood, patientAddress, patientPhone){
			var data = {
					patientNo:patientNo,
					patientName:patientName,
					patientBirth:patientBirth,
					patientGender:patientGender,
					patientBlood:patientBlood,
					patientAddress:patientAddress,
					patientPhone:patientPhone
				};
				
				$.ajax({
					url:"http://localhost:8888/rest/patient",
					method:"post",
					contentType:"application/json",
					data:JSON.stringify(data),
					success:function(){
						loadList();
					}
				});
		};
		
		
		//목록을 불러오는 함수
		function loadList() {
			$.ajax({
				url:"http://localhost:8888/rest/patient",
				method:"get",
				success:function(resp){
					//console.log(resp);
					$(".list-view").empty();
					for(var i = 0 ; i < resp.length; i++) {
						var h3 = $("<h3>").text(resp[i].patientName+"/"+resp[i].patientBirth+"/"+resp[i].patientGender+
								"/"+resp[i].patientBlood+"/"+resp[i].patientAddress+"/"+resp[i].patientPhone)
						.attr("data-patient-no", resp[i].patientNo)
						.attr("data-patient-name", resp[i].patientName)
						.attr("data-patient-birth", resp[i].patientBirth)
						.attr("data-patient-gender", resp[i].patientGender)
						.attr("data-patient-blood", resp[i].patientBlood)
						.attr("data-patient-address", resp[i].patientAddress)
						.attr("data-patient-phone", resp[i].patientPhone);
						
						h3.click(function(){
							console.log($(this));
							$("[name=patientNo]").val($(this).data("patient-no"));
							$("[name=patientName]").val($(this).data("patient-name"));
							$("[name=patientBirth]").val($(this).data("patient-birth"));
							$("[name=patientGender]").val($(this).data("patient-gender"));
							$("[name=patientBlood]").val($(this).data("patient-blood"));
							$("[name=patientAddress]").val($(this).data("patient-address"));
							$("[name=patientPhone]").val($(this).data("patient-phone"));
						});
						
						$(".list-view").append(h3);
					}
				}
			});
		}
	
</script>
<meta charset="UTF-8">
<title>환자 접수</title>
</head>
<body>
	<div class="container-1200">
			<div class="row center">
				<h1>환자 접수</h1>
			</div>
			<form class="detail-view">
				<input name="patientNo" type="hidden" placeholder="번호" required>
				<input name="patientName" type="text"  placeholder="이름" required><br><br>
				<input name="patientBirth" type="date"  required><br><br>
				<input name="patientGender" type="text"  required placeholder="성별"><br><br>
				<input name="patientBlood" type="text"  placeholder="혈액형"  required><br><br>
				<input name="patientAddress" type="text"  placeholder="주소"  required><br><br>
				<input name="patientPhone" type="tel"  placeholder="핸드폰번호"  required><br><br>
				<button type="submit">등록</button>
				<button type="button" class="edit-btn">수정</button>
			</form>
			<hr>
			<div class="list-view">
			</div>
		</div>
		

</body>
</html>