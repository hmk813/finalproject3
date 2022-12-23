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

.sp1{
font-size: 34px;
font-weight: 700;
color: #3f3f3f;
}
.result{
	text-align:center;
	font-size: 30px;
	font-weight: 700;
	color: #3f3f3f;
}
.depbox{
margin-top: 20px;
margin-left: 670px;
}
.catebox{
margin-left: 10px;
}

/*  */
	
	table {
  border: 1px #a39485 solid;
  font-size: .9em;
  box-shadow: 0 2px 5px rgba(0,0,0,.25);
  width: 100%;
  border-collapse: collapse;
  border-radius: 5px;
  overflow: hidden;
}

th {
  text-align: left;
}
  
thead {
  font-weight: bold;
  color: #fff;
  background: #73685d;
}
  
 td, th {
  padding: 1em .5em;
  vertical-align: middle;
}
  
 td {
  border-bottom: 1px solid rgba(0,0,0,.1);
  background: #fff;
}

a {
  color: #73685d;
}
  
 @media all and (max-width: 768px) {
    
  table, thead, tbody, th, td, tr {
    display: block;
  }
  
  th {
    text-align: right;
  }
  
  table {
    position: relative; 
    padding-bottom: 0;
    border: none;
    box-shadow: 0 0 10px rgba(0,0,0,.2);
  }
  
  thead {
    float: left;
    white-space: nowrap;
  }
  
  tbody {
    overflow-x: auto;
    overflow-y: hidden;
    position: relative;
    white-space: nowrap;
  }
  
  tr {
    display: inline-block;
    vertical-align: top;
  }
  
  th {
    border-bottom: 1px solid #a39485;
  }
  
  td {
    border-bottom: 1px solid #e5e5e5;
  }
  
  .btn1{
       border: 1px solid #4e73df;
       border-radius: 0.7em;
       background-color: #4e73df;
       color: #FFF;
  }
  .btn-div{
  margin-left: 400px;
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
   <span class="sp1">의료장비</span>
   <div>
		<table class="table">
		<thead>
		<tr>
		<th>부서</th>
		<th>분류</th>
		</tr>
		</thead>
		<tbody>
		<tr>
		<td>내과</td>
		<td>심실세동기</td>
		</tr>
		<tr>
		<td>외과</td>
		<td>혈압기</td>
		</tr>
		<tr>
		<td>정형외과</td>
		<td>휠체어</td>
		</tr>
		<tr>
		<td>영상의학과</td>
		<td>MRI</td>
		</tr>
		</tbody>
		</table>
   </div>
    <select class="depbox" size="5"  name="selectedBox">
	  <option selected>선택하세요</option>
	  <option value="1">내과</option>
	  <option value="2">외과</option>
	  <option value="3">정형외과</option>
	  <option value="4">영상의학과</option>
	</select>
     
    <select class="catebox" size="5" name="selectedBox1">
        <option selected>선택하세요</option>
        <option value="0">심실세동기</option>
        <option value="1">혈압기</option>
        <option value="2">휠체어</option>
        <option value="3">MRI</option>
    </select> 
  
    <input class="input1" type="number" name="number_select" min="1" max="10" value="0"><br><br>                
  
    <div class="result">
        부서 : <span class="dep"></span><br>
        분류 : <span class="cate"></span><br>
        수량 : <span class="count"></span><br>
   	<button type="button" class="btn1">신청</button>
    </div>
   
   
</body>

</html>