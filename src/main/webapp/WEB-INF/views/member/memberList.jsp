<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원목록</title>
<link href="${pageContext.request.contextPath}/resources/css/member/memberList.css" rel="stylesheet">

</head>
<body>
<div class="container">
	<div class="row">
		<jsp:include page="/WEB-INF/views/common/menu.jsp" /> 
		<div class="col">
			<jsp:include page="/WEB-INF/views/common/header.jsp" />
				<div class="content">
					<h4 class="fw-bold">> 직원목록</h4>
					<div class="d-flex justify-content-between align-items-center">
					<div>총 <span class="form-required" id="memberCount">${totalRows}</span>명의 회원이 있습니다.</div>
						<div class="d-flex">
                        <div class="table-list-filters">
                            <div class="schema-filter">
							<select id="schemaSelect" class="form-select"
								aria-label="Default select example">
								<option selected>ID</option>
								<option>이름</option>
								<option>권한</option>
								<option>소속</option>
								<option>사번</option>
							</select>
						</div>
						</div>
						<div class="search-box">
							<form>
								<input class="form-control me-2" type="search"
									id="memberSearch" placeholder="Search" aria-label="Search">
								<i class="bi bi-search"></i>
							</form>
						</div>
					</div>
					</div>
					<div class="table-container">
						<table class="table table-hover">
							<thead class="table">
								<tr class="table-primary">
									<th scope="col">No.</th>
									<th scope="col">ID</th>
									<th scope="col">이름</th>
									<th scope="col">권한</th>
									<th scope="col">소속</th>
									<th scope="col">사번</th>
									<th scope="col">연락처</th>
								</tr>
							</thead>
							<tbody id="memberList">
								<c:forEach items="${list}" var="member" varStatus="status">
									<tr>
										<td scope="row">${status.index+1}</td>
										<td>${member.MId}</td>
										<td>${member.MName}</td>
										<td>${member.MRole}</td>
										<td>${member.teamName}</td>
										<td>${member.MEmpId}</td>
										<td>${member.MTel}</td>
							</tr>
								 </c:forEach>
							</tbody>
						</table>
					</div>
					
					<div class="page">
	           			<a href="memberList?pageNo=1" class="btn btn-outline-primary btn-sm"><<</a>
	           			<c:if test="${pager.groupNo>1}">
	           				<a href="noticeList?pageNo=${pager.startPageNo-1}" class="btn btn-outline-info btn-sm"><</a>
	           			</c:if>
	           			
	           			<c:forEach begin="${pager.startPageNo}" end="${pager.endPageNo}" step="1" var="i">
	           				<c:if test="${pager.pageNo==i}">
	           					<a href="memberList?pageNo=${i}" class="btn btn-outline-primary btn-sm">${i}</a>
	           				</c:if>
	           				<c:if test="${pager.pageNo!=i}">
	           					<a href="memberList?pageNo=${i}" class="btn btn-outline-primary btn-sm">${i}</a>
	           				</c:if>
	           			</c:forEach>
	           			
	           			<c:if test="${pager.groupNo<pager.totalGroupNo}">
	           				<a href="memberList?pageNo=${pager.endPageNo+1}" class="btn btn-outline-info btn-sm">></a>
	           			</c:if>
	           			<a href="memberList?pageNo=${pager.totalPageNo}" class="btn btn-outline-primary btn-sm">>></a>
	           			
	           		</div>
				</div>
			</div>
	</div>
</div> 
<script src="${pageContext.request.contextPath}/resources/js/member/memberList.js"></script>
</body>
</html>