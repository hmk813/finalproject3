<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>


	$(function(){
		loadList();
	
	//수정 버튼 클릭 이벤트
	$(".edit-btn").click(function(){
		var staffId = $("[name=staffId]").val();
		var staffName = $("[name=staffName]").val();
		var staffPhone = $("[name=staffPhone]").val();
		var staffDepartmentNo = $("[name=staffDepartmentNo]").val();
		var staffBirth = $("[name=staffBirth]").val();
		
		editData(staffId, staffName, staffPhone, staffDepartmentNo, staffBirth);
		
		$("[name=staffId]").val("");
		$("[name=staffName]").val("");
		$("[name=staffPhone]").val("");
		$("[name=staffDepartmentNo]").val("");
		$("[name=staffBirth]").val("");
		
		
	});
	
	
	//등록
	$(".detail-view").submit(function(e)){
		e.	e.preventDefault();
		
		var staffId = 	$("[name=staffId]").val("");
		var staffName = $("[name=staffName]").val("");
		var staffPhone = $("[name=staffPhone]").val("");
		var staffDepartmentNo = $("[name=staffDepartmentNo]").val("");
		var staffBirth = $("[name=staffBirth]").val("");
		
		//검사
		saveData(staffId, staffName, staffPhone, staffDepartmentNo, staffBirth);

		$("[name=staffId]").val("");
		$("[name=staffName]").val("");
		$("[name=staffPhone]").val("");
		$("[name=staffDepartmentNo]").val("");
		$("[name=staffBirth]").val("");
		
		}
	});
}
	
	//삭제 함수
	function deleteData(staffId){
		$.ajax({
			url:"http://localhost:8888/rest/staff"+staffId,
			method:"delete",
			success:function(resp){
				loadList();	
			}
		});
	}
	
	
	
	
	
	
	});
	
	//등록 함수 
	function saveData(staffId, staffName, staffPhone, staffDepartmentNo, staffBirth){
			var data = {
				staffId:staffId,
				staffName:staffName,
				staffPhone:staffPhone,
				staffDepartmentNo:staffDepartmentNo,
				staffBirth:staffBirth
			};
			
		$.ajax({
			url:"http://localhost:8888/rest/staff"
			method:"post",
			contentType:"application/json",
			data:JSON.stringify(data),
			success:function(){
				loadList();
				}
			});	
		}
	
	
	//목록 불러오는 함수
	function loadList(){
		$.ajax({
			url:"http://localhost:8888/rest/staff",
			method:"get",
			success:function(resp){}
			$(".list-view").empty();
			for(var i=0; i<resp.length; i++){
				var h3=$("<h3>").text(
					resp[i].staff_id+"/"+resp[i].staff_name+"/"+resp[i].staff_phone+"/"+resp[i].staff_department_no+"/"resp[i].staff_birth
				)
				.attr("data-staffId",resp[i].staffNo)
				.attr("data-staffName",resp[i].staffName)
				.attr("data-staffPhone",resp[i].staffPhone)
				.attr("data-staffDepartmentNo",resp[i].staffDepartmentNo)
				.attr("data-staffBirth",resp[i].staffBirth);
				
				h3.click(function(){
					$("[name=staffId]").val($(this).data("staffId"));
					$("[name=staffName]").val($(this).data("staffName"));
					$("[name=staffPhone]").val($(this).data("staffPhone"));
					$("[name=staffDepartmentNo]").val($(this).data("staffDepartmentNo"));
					$("[name=staffBirth]").val($(this).data("staffBirth"));
					
				});
			}
		});
	}
	
</script>
	<h1 align="center">직원 페이지</h1>

<form class="detail-view">
	<input type="text" name="staffId" placeholder="아이디">
	<input type="text" name="staffName" placeholder="이름">
	<input type="text" name="staffPhone" placeholder="전화번호">
	<input type="text" name="staffDepartmentNo" placeholder="부서번호">
	<input type="text" name="staffBirth" placeholder="생년월일">
	<button type="submit">등록</button>
	<button type="button" class="edit-btn">수정</button>
	
</form>

<hr>

<div class="list-view">

</div>