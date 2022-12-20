<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="직원 생성" name="title"/>
</jsp:include>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<!-- Bootswatch CDN -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.0.2/cosmo/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>

<style>
	.container-450 { 
		width:450px; margin:0 auto; 
	}
	div{
 		border: 1px solid gray;
	}
	.select{
		width: 50%
	}
</style>

<form action="join" method="post" enctype="multipart/form-data">
	<div class="container-450" style="margin: 50px">

		<div class="row">
			<h1 class="text-center">직원 생성</h1>
		</div>

		<div class="row mt-3">
        	<div class="col-md-10 offset-md-1">
            	<div class="form-floating">
                	<input class="form-control rounded" name="staffId" type="text" placeholder="아이디" autocomplete="off" required>
                    <label>아이디</label>
			</div>

                <br>

            <div class="form-floating">
                <input class="form-control rounded" name="staffPw" type="password" placeholder="비밀번호" required>
                <label>비밀번호</label>
            </div>

               <br>

            <div class="form-floating">
                <input class="form-control rounded" name="staffName" type="text" placeholder="이름" autocomplete="off" required>
                <label>이름</label>
            </div>

            	<br>

			<div class="select">
				<select name="staffDepartmentNo" required>
					<!-- 반복문 -->
					<option value = "">부서 선택</option>
					<c:forEach var = "selectDepartment" items = "${department}">
						<option value="${selectDepartment.departmentNo}">${selectDepartment.departmentName}</option>
					</c:forEach>
				</select>
			</div>

				<br>

		<div class="row">
			<label>이름</label>
			<input name="staffName" type="text" required>
		</div>
			<br><br>
			<div class="form-floating">
                <input class="form-control rounded" name="staffBirth" type="date" placeholder="생년월일" required>
                <label>생년월일</label>
            </div>

			부서 : 
			<select name="staffDepartmentNo" required>
				<!-- 반복문 -->
				<option value = "">선택</option>
				<c:forEach var = "selectDepartment" items = "${department}">
					<option value="${selectDepartment.departmentNo}">${selectDepartment.departmentName}</option>
				</c:forEach>
			</select>
			<br><br>

			생년월일 : <input name="staffBirth" type="date" required> <br><br>
				<br>

			입사일 : <input name="staffEnrollDate" type="date" required><br><br>
			<div class="form-floating">
                <input class="form-control rounded" name="staffEnrollDate" type="date" placeholder="입사일" required>
                <label>입사일</label>
            </div>

			<div class="row left mt-30">직급</div>
			<div>
				<input type="radio" name="staffGrade" value="관리자"> 관리자
				<input type="radio" name="staffGrade" value="부장"> 부장
				<input type="radio" name="staffGrade" value="과장"> 과장
				<input type="radio" name="staffGrade" value="팀장"> 팀장
				<input type="radio" name="staffGrade" value="사원"> 사원
			</div>
				<br>

			<div class="form-floating">
                <input class="form-control rounded" name="staffPhone" type="tel" placeholder="전화번호" autocomplete="off" required>
                <label>전화번호</label>
            </div>

			전화번호 : <input name="staffPhone" type="tel"> <br><br>
				<br>

			주소 : <input name ="staffAddress" type="text"><br><br>
			<div class="form-floating">
                <input class="form-control rounded" name="staffAddress" type="text" placeholder="주소" autocomplete="off">
                <label>주소</label>
                <button>검색</button>
            </div>

			<div class="row left mt-30">진료과</div>
				<br>

			<div class="form-floating">직급</div>
            <div>
				<input type="radio" name="staffGrade" value="관리자"> 관리자 
				<input type="radio" name="staffGrade" value="부장"> 부장 
				<input type="radio" name="staffGrade" value="과장"> 과장 
				<input type="radio" name="staffGrade" value="팀장"> 팀장 
				<input type="radio" name="staffGrade" value="사원"> 사원 
			</div>

				<br>

			<div class="form-floating">진료과</div>
            <div>
				<input type="radio" name="staffMedicalDepartment" value=null> 선택하지 않음 
				<input type="radio" name="staffMedicalDepartment" value="내과"> 내과 
				<input type="radio" name="staffMedicalDepartment" value="외과"> 외과 
				<input type="radio" name="staffMedicalDepartment" value="정형외과"> 정형외과 
				<input type="radio" name="staffMedicalDepartment" value="영상의학과"> 영상의학과 
			</div>

				<br>

			<div class="form-floating">사진</div>
			<div>
				<input type="radio" name="staffMedicalDepartment" value=null> 선택하지 않음
				<input type="radio" name="staffMedicalDepartment" value="내과"> 내과
				<input type="radio" name="staffMedicalDepartment" value="외과"> 외과
				<input type="radio" name="staffMedicalDepartment" value="정형외과"> 정형외과
				<input type="radio" name="staffMedicalDepartment" value="영상의학과"> 영상의학과
				<input type="file" name="staffImg" accept=".png, .jpg" multiple="multiple">
			</div>
			<br>

			직원이미지 : 
			<input type="file" name="staffImg" accept=".png, .jpg" multiple="multiple">
			<br><br>

			<button type="submit">생성하기</button>


				<br>

			<div class="form-floating" >
				<button type="submit">생성하기</button>
			</div>

        </div>
	</div>

	</div>
</form>

<!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script>
	<!-- jquery를 사용하기 위하여 라이브러리 js 파일을 불러온다-->
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <script type="text/javascript">
    	$(function(){
    		
    	}
    </script>
    		$(".btn").click(function(e){
                var choice = confirm("입력한 정보로 생성하시겠습니까?");
                if(choice){
                    return true;//통과
                }
                else {
                    return false;//차단
                }
            });
    	})
	</script>

	<!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>