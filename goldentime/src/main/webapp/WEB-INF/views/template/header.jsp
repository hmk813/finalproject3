<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="login" value="${loginId != null}"></c:set>
<c:set var="admin" value="${mg == '관리자'}"></c:set>

<html>
	<head>
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>
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
		
		<style>
        	* {
			  margin: 0;
			  padding: 0;
			}
			
			a {
			  text-decoration: none;
			}
			
			li {
			  list-style-type: none;
			}
			
			.header {
			  background-color: skyblue;
			  width: 100%;
			  height: 100px;
			}
			
			.nav {
			  display: flex;/* 한줄에 배치 */
			  justify-content: space-between;/* 사이에 균일한 간격 생성 */
			  align-items: center;
			  padding: 20px 50px;
			  color: white;
			}
			
			/* 타이틀 클래스 폰트 사이즈 */
			.title {
			  font-size: 40px;
			}
			
			/* 타이틀 클래스 a태그 글자 색 */
			.title > a {
			  color: white;
			}
			
			/* 웹 브라우저 가로의 최대 너비가 625px 이상일 때 */
			@media screen and (min-width: 625px) {

				#menu {
					display: flex;
				}
				
				#menu > li {
				    padding: 20px 30px;
				    font-size: 20px;
				}
				
				li > a {
				    color: white;
				}
				
				.fas {
				    display: none;
				}
			
			}
			
			/* 웹 브라우저 가로의 최대 너비가 625px 이하일 때 */
			@media screen and (max-width: 625px) {

			  	.nav {
			    	padding: 30px 40px;
			 	}
			
			  	#menu {
			    	display: none;
			  	}
			
			  	.fas {
			    	font-size: 2em;
			  	}
			}
		</style>
		
</head>
<body>

	<!-- main 영역의 시작과 끝 -->
	    <main>
	
	        <!-- 메뉴 -->
	        <header>
				<section class="header">
				    <div class="nav">
					    <div class="title"><a href="/"><i class="fa-sharp fa-solid fa-hospital"></i></a></div>
					    <ul id="menu">
					      	<li><a href="">예약</a></li>
					     	<li><a href="">환자 현황</a></li>
					     	<li><a href="">환자 기록</a></li>
					     	<li><a href="">수술 환자</a></li>
					     	<li><a href="">입원 환자</a></li>
					    </ul>
					    <i class="fas fa-sharp fa-solid fa-bars"></i>
				    </div>
			  	</section>
			</header>
			
	        <!-- 사이드바 + 컨텐츠 -->
            <section class="w-100">
            
		