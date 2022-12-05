<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>


	$(function(){
		loadList();
	});
	
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
				.attr("data-staff")
			}
		});
	}
	
</script>