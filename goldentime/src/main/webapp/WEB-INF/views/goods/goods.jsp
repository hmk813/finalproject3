<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/views/template/goodsHeader.jsp">
   <jsp:param value="물품신청" name="title" />
</jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>드림 병원</title>
   
      <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script type="text/javascript"></script>
<style>

@import url(https://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100);

body {
  background-color: #3e94ec;
  font-family: "Roboto", helvetica, arial, sans-serif;
  font-size: 16px;
  font-weight: 400;
  text-rendering: optimizeLegibility;
}

div.table-title {
   display: block;
  margin: auto;
  max-width: 600px;
  padding:5px;
  width: 100%;
}

.table-title h3 {
   color: #34ace0;
   font-size: 30px;
   font-weight: 400;
   font-style:normal;
   font-family: "Roboto", helvetica, arial, sans-serif;
   text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
   text-transform:uppercase;
   text-align:center;
}


/*** Table Styles **/

.table-fill {
  background: white;
  border-radius:3px;
  border-collapse: collapse;
  height: 320px;
  margin: auto;
  max-width: 600px;
  padding:5px;
  width: 100%;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
  animation: float 5s infinite;
}
 
th {
  color:#D5DDE5;;
  background:#1b1e24;
  border-bottom:4px solid #9ea7af;
  border-right: 1px solid #343a45;
  font-size:23px;
  font-weight: 100;
  padding:24px;
  text-align:left;
  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
  vertical-align:middle;
}

th:first-child {
  border-top-left-radius:3px;
}
 
th:last-child {
  border-top-right-radius:3px;
  border-right:none;
}
  
tr {
  border-top: 1px solid #C1C3D1;
  border-bottom-: 1px solid #C1C3D1;
  color:#666B85;
  font-size:16px;
  font-weight:normal;
  text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
}
 
tr:hover td {
  background:#4E5066;
  color:#FFFFFF;
  border-top: 1px solid #22262e;
}
 
tr:first-child {
  border-top:none;
}

tr:last-child {
  border-bottom:none;
}
 
tr:nth-child(odd) td {
  background:#EBEBEB;
}
 
tr:nth-child(odd):hover td {
  background:#4E5066;
}

tr:last-child td:first-child {
  border-bottom-left-radius:3px;
}
 
tr:last-child td:last-child {
  border-bottom-right-radius:3px;
}
 
td {
  background:#FFFFFF;
  padding:20px;
  text-align:left;
  vertical-align:middle;
  font-weight:300;
  font-size:18px;
  text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
  border-right: 1px solid #C1C3D1;
}

td:last-child {
  border-right: 0px;
}

th.text-left {
  text-align: left;
}

th.text-center {
  text-align: center;
}

th.text-right {
  text-align: right;
}

td.text-left {
  text-align: left;
}

td.text-center {
  text-align: center;
}

td.text-right {
  text-align: right;
}

.depbox{
	position:absolute;
	left:750px;
	bottom:200px;
}

.catebox{
	position:absolute;
	left:950px;
	bottom:200px;
}

.input1{
	position:absolute;
	right:500px;
	bottom:200px;
}

.result{
	position:absolute;
	bottom:100px;
	left:950px;
}
</style>
</head>
  
<script>


$(function(){

    $("[name=selectedBox]").on("input",function(){
        var dep = $("[name=selectedBox] option:checked").text();
        $(".dep").text(dep);
    });
    $("[name=selectedBox1]").on("input",function(){
        var cate = $("[name=selectedBox1] option:checked").text();
        $(".cate").text(cate);
    });
    $("[name=number_select]").on("input",function(){
        var count = $("[name=number_select]").val();
        $(".count").text(count);
    });
    
});

</script>
<body>
   
		<div class="table-title">
		<h3>물품신청</h3>
		</div>
		<table class="table-fill">
		<thead>
		<tr>
		<th class="text-center">부서</th>
		<th class="text-center">분류</th>
		</tr>
		</thead>
		<tbody class="table-hover">
		<tr>
		<td class="text-center">내과</td>
		<td class="text-center">심실세동기</td>
		</tr>
		<tr>
		<td class="text-center">외과</td>
		<td class="text-center">혈압기</td>
		</tr>
		<tr>
		<td class="text-center">정형외과</td>
		<td class="text-center">휠체어</td>
		</tr>
		<tr>
		<td class="text-center">영상의학과</td>
		<td class="text-center">MRI</td>
		</tr>
		</tbody>
		</table>
		  </body> 
     
    <select class="depbox" size="5" aria-label="size 5 select example" name="selectedBox">
	  <option selected>선택하세요</option>
	  <option value="1">내과</option>
	  <option value="2">외과</option>
	  <option value="3">정형외과</option>
	  <option value="4">영상의학과</option>
	</select>
     
    <select class="catebox" size="5" aria-label="size 5 select example" name="selectedBox1">
        <option selected>선택하세요</option>
        <option value="0">심실세동기</option>
        <option value="1">혈압기</option>
        <option value="2">휠체어</option>
        <option value="3">MRI</option>
    </select> 
  
    <input class="input1" type="number" name="number_select" min="1" max="10" value="0"><br><br>                
  
    <div class="result">
        부서 : <span class="dep"></span>,
        분류 : <span class="cate"></span>,
        수량 : <span class="count"></span>
    </div>
           
   
</body>

</html>