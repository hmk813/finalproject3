<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp">
	<jsp:param value="직원 검색" name="title"/>
</jsp:include>

<style>
	.container-500 { 
		width:500px; margin:0 auto; 
	}
	div{
/*   		border: 1px solid gray; */
	}
	.table > thead,
	.table > tfoot {
		background-color: #ececec;
	}
	.pagination {
		justify-content : center;
		display: flex;
		list-style: none;/* ul태그 점 제거 */
	}
	a {
  		text-decoration: none; /* 밑줄 없애기 */
	}
</style>

		<div class="row mt-4">
		
	    	<div class="col-md-10 offset-md-1">
				<h1 class="text-center font-weight-bold">직원 목록</h1>
			</div>
			
		</div>

	<!-- 검색창 -->
	<form action="list" method="get" align="center" style="margin-top: 10px">
		 <select name="type" required>
		 	<option value="staff_name">이름</option>
		 	<option value="department_name">부서</option>
		 	<option value="staff_grade">직위</option>
		 	<option value="staff_medical_department">진료과</option>
		 </select>
		
		<input type="search" name="keyword" required value="${param.keyword}">
		
		<button type="submit">검색</button>
	</form>


	<!-- 결과화면 -->
	<div class="row mt-2">
	    <div class="col-md-10 offset-md-1">
	    
	        <table class="table table-hover">
	        
	            <thead class="text-center">
	                <tr class="head">
	                    <th>이름</th>
	                    <th>부서</th>
	                    <th>직위</th>
	                    <th>진료과</th>
	                    <th>메뉴</th>
	                </tr>
	            </thead>
	            
	            <tbody class="text-center">
	                <c:forEach var="staffDto" items="${staffList}">
						<tr>
							<td class="align-middle">${staffDto.staffName}</td>
							<td class="align-middle">${staffDto.departmentName}</td>
							<td class="align-middle">${staffDto.staffGrade}</td>
							<td class="align-middle">${staffDto.staffMedicalDepartment}</td>
							<td class="align-middle">
								<a class="btn" style="padding:4px;" href="detail?staffId=${staffDto.staffId}">상세</a>
								<a class="btn" style="padding:4px;" href="delete?staffId=${staffDto.staffId}">삭제</a>
							</td>
						</tr>
					</c:forEach>
	            </tbody>
	            
	            <tfoot>
					<tr>
						<td colspan="5" align="right">
							<a href="join">직원 등록</a>
						</td>
					</tr>
				</tfoot>
				
	        </table>
	        
	    </div>
	</div>
        
        
<%-- 페이지 네비게이터 --%>
<div class="mt-10 mb-10" align="center">
	<ul class="pagination">
		<c:choose>
			<c:when test = "${staffSearchVO.isFirst()}">
				<li class="page-item">
					<a class="page-link" href = "">&laquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
					<a class="page-link" href = "list?p=${staffSearchVO.firstBlock()}&${staffSearchVO.parameter()}">&laquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test = "${staffSearchVO.hasPrev()}">
				<li class="page-item">
					<a class="page-link" href = "list?p=${staffSearchVO.prevBlock()}&${staffSearchVO.parameter()}">&lt;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
					<a class="page-link" href = "">&lt;</a>
				</li>
			</c:otherwise>
		</c:choose>
		
		<c:forEach var = "i" begin = "${staffSearchVO.startBlock()}" end = "${staffSearchVO.endBlock()}" step = "1">
			<li class="page-item">
				<a class="page-link" href = "list?p=${i}&${staffSearchVO.parameter()}">${i}</a>
			</li>
		</c:forEach>
		
		<c:choose>
			<c:when test = "${staffSearchVO.hasNext()}">
				<li class="page-item">
					<a class="page-link" href = "list?p=${staffSearchVO.nextBlock()}&${staffSearchVO.parameter()}">&gt;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
					<a class="page-link" href = "">&gt;</a>
				</li>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test = "${staffSearchVO.isLast()}">
				<li class="page-item">
					<a class="page-link" href = "">&raquo;</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
					<a class="page-link" href = "list?p=${staffSearchVO.lastBlock()}&${staffSearchVO.parameter()}">&raquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>