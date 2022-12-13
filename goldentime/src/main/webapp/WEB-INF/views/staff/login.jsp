<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

	<!-- Bootstrap CSS -->
   	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootswatch CDN -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.0.2/cosmo/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<link rel="stylesheet" type="text/css" href="./css/reset.css">
<link rel="stylesheet" type="text/css" href="./css/commons.css">

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="로그인" name="title"/>
</jsp:include>

<body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Login</h3></div>
                                    <div class="card-body">
                   						
                   						<form class="login-form" action="login" method="post" autocomplete="off">
                                           <div class="row center">
											<input class="input_underline" type="text" name="staffId"  id="staffId"required placeholder="Id" autocomplete="off"><br>
											</div>
											<br>
	
										<div class="row center">
											<input class="input_underline" type="password" name="staffPw" required placeholder="Password" autocomplete="off">
										</div>
										
										<c:if test="${param.error != null}">
										<div class="row mt-4">
											<span style="color:red;">아이디 / 비밀번호를 잘못 입력했습니다.</span>
										</div>
										</c:if>
										
										<div class="d-flex align-items-center justify-content-between mt-4 mb-0">
										        <button class="btn btn-primary" type="submit">Login</button>
										   </div>
                                        </form>
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2022</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>

</body>
	
