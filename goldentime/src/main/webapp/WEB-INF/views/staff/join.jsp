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
	@import url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/OTWelcomeRA.woff2') format('woff2');
	h1 {
	    font-family: 'OTWelcomeRA';
	    font-weight: normal;
	    font-style: normal;
	}
	.container-450 { 
		width:450px; margin:0 auto; 
	}
	div{
/*  		border: 1px solid gray; */
	}
	.select{
		width: 50%
	}
	.btn-find-address,
	.btn {
		border: 2px solid #dae0e7;
		border-radius: 0.5em;
		background-color: #f3f3f3;
	}
</style>

<form action="join" method="post" enctype="multipart/form-data">
	<div class="container-450" style="margin: 50px">

		<div class="row">
			<h1 class="text-center font-weight-bold">직원 생성</h1>
		</div>

		<div class="row mt-3">
        	<div class="col-md-10 offset-md-1">
            	<div class="form-floating">
                	<input class="form-control rounded" name="staffId" type="text" placeholder="아이디" autocomplete="off" required>
                    <label>
                    	아이디
                    	<i class="fa-solid fa-asterisk text-danger" style="font-size: 13px"></i>
                    </label>
			</div>

                <br>

            <div class="form-floating">
                <input class="form-control rounded" name="staffPw" type="password" placeholder="비밀번호" required>
                <label>
                	비밀번호
                	<i class="fa-solid fa-asterisk text-danger" style="font-size: 13px"></i>
                </label>
            </div>

               <br>

            <div class="form-floating">
                <input class="form-control rounded" name="staffName" type="text" placeholder="이름" autocomplete="off" required>
                <label>
                	이름
                	<i class="fa-solid fa-asterisk text-danger" style="font-size: 13px"></i>
                </label>
            </div>

            	<br>
            
			<div class="form-floating">
                <input class="form-control rounded" name="staffBirth" type="date" placeholder="생년월일" required>
                <label>
                	생년월일
                	<i class="fa-solid fa-asterisk text-danger" style="font-size: 13px"></i>
                </label>
            </div>
			
				<br>
			
			<div class="form-floating">
                <input class="form-control rounded" name="staffEnrollDate" type="date" placeholder="입사일" required>
                <label>
                	입사일
                	<i class="fa-solid fa-asterisk text-danger" style="font-size: 13px"></i>
                </label>
            </div>
			
				<br>
			
			<div class="form-floating">
                <input class="form-control rounded" name="staffPhone" type="tel" placeholder="전화번호" autocomplete="off" required>
                <label>
                	전화번호
                	<i class="fa-solid fa-asterisk text-danger" style="font-size: 13px"></i>
                </label>
            </div>
			
				<br>
			
			<div class="form-floating">
                <input class="form-control rounded" name="staffAddress" type="text" placeholder="주소" autocomplete="off">
                <label>주소</label>
                <button class="btn-find-address" style="float: right;">검색</button>
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
				<i class="fa-solid fa-asterisk text-danger" style="font-size: 13px"></i>
			</div>

				<br>
			
			<div class="form-floating mb-1">
				직위 선택
				<i class="fa-solid fa-asterisk text-danger" style="font-size: 13px"></i>
			</div>
            <div>
				<input type="radio" name="staffGrade" value="관리자"> 관리자 &nbsp;&nbsp;&nbsp;
				<input type="radio" name="staffGrade" value="부장"> 부장 &nbsp;&nbsp;&nbsp;
				<input type="radio" name="staffGrade" value="과장"> 과장 &nbsp;&nbsp;&nbsp;
				<input type="radio" name="staffGrade" value="팀장"> 팀장 &nbsp;&nbsp;&nbsp;
				<input type="radio" name="staffGrade" value="사원"> 사원 
			</div>

				<br>
				
			<div class="form-floating mb-1">
				진료과 선택
				<i class="fa-solid fa-asterisk text-danger" style="font-size: 13px"></i>
			</div>
            <div>
				<input type="radio" name="staffMedicalDepartment" value=null> 선택하지 않음 &nbsp;&nbsp;&nbsp;
				<input type="radio" name="staffMedicalDepartment" value="내과"> 내과 &nbsp;&nbsp;&nbsp;
				<input type="radio" name="staffMedicalDepartment" value="외과"> 외과 &nbsp;&nbsp;&nbsp;
				<br>
				<input type="radio" name="staffMedicalDepartment" value="정형외과"> 정형외과 &nbsp;&nbsp;&nbsp;
				<input type="radio" name="staffMedicalDepartment" value="영상의학과"> 영상의학과 
			</div>

				<br>
				
			<div class="form-floating mb-1">사진 선택</div>
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
				<button class="btn" type="submit" style="float: right;">생성하기</button>
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
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="daum-post-api.js"></script>
    <script type="text/javascript">
	    function findAddress() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                //주소 정보를 해당 필드에 넣는다.
	                document.querySelector("[name=staffAddress]").value = addr;
	            }
	        }).open();
	    }
	    
        $(function(){
            $(".btn-find-address").click(findAddress);
        });
    </script>
	
	<!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>