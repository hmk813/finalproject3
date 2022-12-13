<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="login" value="${loginId != null}"></c:set>
<c:set var="admin" value="${mg == '관리자'}"></c:set>

<html>
	<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootswatch CDN -->
    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.2.2/spacelab/bootstrap.min.css">

    <link rel="stylesheet" type="text/css"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />

    <style>
        body {
            height:1000px;
        }
    </style>

	<title>
		<c:choose>
			<c:when test="${param.title != null}">
				${param.title}
			</c:when>
			<c:otherwise>
				홈페이지
			</c:otherwise>
		</c:choose>
	</title>
		
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">

            <!-- Brand : 로고 이미지와 대표 상호를 적는 공간 -->
            <a class="navbar-brand" href="#">
                <i class="fa-sharp fa-solid fa-hospital"></i>골든타임
            </a>

            <!-- 토글 버튼 -->
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- 메뉴 영역 -->
            <div class="collapse navbar-collapse" id="navbarColor03">
                <ul class="navbar-nav me-auto">

                <!-- 
                    메뉴 항목 
                    - .active는 활성화된 메뉴(현재 메뉴), 상황에 따라 맞는 메뉴에 추가
                -->
                <li class="nav-item">
                    <a class="nav-link" href="/attendance/list">근태 관리</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/vacation/vacation">연차 관리</a>
                </li>
                </ul>
                
            </div>

        </div>
    </nav>

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
		