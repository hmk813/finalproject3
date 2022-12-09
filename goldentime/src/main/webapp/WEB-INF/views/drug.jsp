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
			var diagnosisNo = $("[name=diagnosisNo]").val();
			var drugName = $("[name=drugName]").val();
			
			editData(diagnosisNo, drugName);
			
			$("[name=diagnosisNo]").val("");
			$("[name=drugName]").val("");
		});
		
		//form 에 submit 이벤트를 설정해서 등록 처리
		$(".detail-view").submit(function(e){
			e.preventDefault();
			
			var diagnosisNo = $("[name=diagnosisNo]").val();
			var drugName = $("[name=drugName]").val();
			
			//검사
			saveData(diagnosisNo, drugName);
			
			$("[name=diagnosisNo]").val();
			$("[name=drugName]").val();
		});
	});
	
		//수정 함수
		function editData(diagnosisNo, drugName) {
			var data = {
					diagnosisNo:diagnosisNo,
					drugName:drugName
				};
		
			$.ajax({
				url:"http://localhost:8888/rest/drug",
				method:"put",
				contentType:"application/json",
				data:JSON.stringify(data),
				success:function(){
					loadList();
				}
			});
		};
	
		//등록 함수
		function saveData(diagnosisNo, drugName){
			var data = {
					diagnosisNo:diagnosisNo,
					drugName:drugName
				};
				
				$.ajax({
					url:"http://localhost:8888/rest/drug",
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
				url:"http://localhost:8888/rest/drug",
				method:"get",
				success:function(resp){
					//console.log(resp);
					$(".list-view").empty();
					for(var i = 0 ; i < resp.length; i++) {
						var h3 = $("<h3>").text(resp[i].diagnosisNo+"/"+resp[i].drugName)
						.attr("data-diagnosis-no", resp[i].diagnosisNo)
						.attr("data-drug-name", resp[i].drugName)
						
						h3.click(function(){
							console.log($(this));
							$("[name=diagnosisNo]").val($(this).data("diagnosis-no"));
							$("[name=drugName]").val($(this).data("drug-name"));
						});
						
						$(".list-view").append(h3);
					}
				}
			});
		}
	
</script>
<meta charset="UTF-8">
<title>약 등록</title>
</head>
<body>
	<div class="container-1200">
			<div class="row center">
				<h1>약 등록</h1>
			</div>
			<form class="detail-view">
				<input name="diagnosisNo" type="hidden" placeholder="번호" required>
				<input name="drugName" type="text"  placeholder="이름" required><br><br>
				<button type="submit">등록</button>
				<button type="button" class="edit-btn">수정</button>
			</form>
			<hr>
			<div class="list-view">
			</div>
		</div>
		

</body>
</html>