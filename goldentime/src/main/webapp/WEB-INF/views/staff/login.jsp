<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<style>
	html, body { height: 100%; }
	body {
	  background:radial-gradient(ellipse at center, rgba(255,254,234,1) 0%, rgba(255,254,234,1) 35%, #B7E8EB 100%);
	  overflow: hidden;
	}
	.ocean { 
	  height: 5%;
	  width:100%;
	  position:absolute;
	  bottom:0;
	  left:0;
	  background: #015871;
	}
	
	.wave {
	  background: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/85486/wave.svg) repeat-x; 
	  position: absolute;
	  top: -198px;
	  width: 6400px;
	  height: 198px;
	  animation: wave 7s cubic-bezier( 0.36, 0.45, 0.63, 0.53) infinite;
	  transform: translate3d(0, 0, 0);
	}
	.wave:nth-of-type(2) {
	  top: -175px;
	  animation: wave 7s cubic-bezier( 0.36, 0.45, 0.63, 0.53) -.125s infinite, swell 7s ease -1.25s infinite;
	  opacity: 1;
	}
	@keyframes wave {
	  0% {
	    margin-left: 0;
	  }
  100% {
    margin-left: -1600px;
  }
}
	@keyframes swell {
	  0%, 100% {
	    transform: translate3d(0,-25px,0);
	  }
	  50% {
	    transform: translate3d(0,5px,0);
  	}
	}
	
	/* 로그인 디자인 페이지 시작 */
	.div1, .div2{
	text-align: center;
	}
	.div2{
	margin-top: 100px;
	}
	.div3, .div4{
	margin-top: 10px;
	}
	.hospital-logo{
	width: 300px;
	heigth:300px;
	}
	.sp1{
	font-size: 24px;
	font-weight: 700;
	color: #3f3f3f;
	}
	.id-input{
	border: 1px solid #FFF;
	border-radius: 0.7em;
	background-color: #FFF;
	width: 400px;
	height:50px;
	}
	.id-input:hover,
	.id-input:focus{
	border: 2px solid #FFF;
	outline: none;
	}
	.pw-input{
	border: 1px solid #FFF;
	border-radius: 0.7em;
	background-color: #FFF;
	width: 400px;
	height:50px;
	}
	.pw-input:hover,
	.pw-input:focus{
	border: 2px solid #FFF;
	outline: none;
	}
	.login-btn{
	border: 1px solid #FFF;
	border-radius: 0.7em;
	background-color: #FFF;
	width: 400px;
	height:50px;
	}
	.login-input:hover,
	.login-input:focus{
	border: 2px solid #FFF;
	cursor: pointer;
	outline: none;
	}
	</style>

	<body class="bg-primary">

		<div class="div1">
			<img class="hospital-logo" src="/image/logo.png">
		</div>

		<div class="div2">

		<form class="login-form" action="login" method="post" autocomplete="off">
			<div class="row center">
		
				<input class="id-input" type="text" name="staffId"  id="staffId" required placeholder="아이디" autocomplete="off"><br>
			</div>

			<div class="div3">
				<input class="pw-input" type="password" name="staffPw" required placeholder="비밀번호" autocomplete="off">
			</div>

			<c:if test="${param.error != null}">

				<div class="row mt-4">
					<span style="color:red;">아이디 / 비밀번호를 잘못 입력했습니다.</span>
				</div>
			</c:if>

			<div class="div4">
				<button class="login-btn" type="submit">로그인</button>
			</div>
		</form>
		</div>

		<!--웨이브 애니메이션  -->
		<div class="ocean">
        <div class="wave"></div>
        <div class="wave"></div>
      </div>


	</body>

</html>