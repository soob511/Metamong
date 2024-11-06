<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계정 신청내역</title>
<link href="${pageContext.request.contextPath}/resources/css/notice/noticeList.css" rel="stylesheet">
</head>
<body>
<div class="container">
	<div class="row">
		<jsp:include page="/WEB-INF/views/common/menuAdmin.jsp" /> 
		<div class="col">
			<jsp:include page="/WEB-INF/views/common/header.jsp" />
				<div class="content">
					<h4 class="fw-bold">> 계정 신청내역</h4>
					
					<div class="d-flex justify-content-end">
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
								<input class="form-control me-2" type="search"
									id="memberSearch" name="keyword" placeholder="Search" aria-label="Search" >
								 <i  class="bi bi-search"></i> 
						</div>
					</div>
					
					<div id="memberList" >
					<div class="d-flex  justify-content-start">
					<div>총 <span class="form-required" id="memberCount">${totalRows}</span>건의 신청이 있습니다.</div>
					</div>	

					<table class="table table-hover">
						<thead class="table-secondary">
							<tr>
								<th scope="col">No.</th>
								<th scope="col">신청일</th>
								<th scope="col">ID</th>
								<th scope="col">이름</th>
								<th scope="col">권한</th>
								<th scope="col">소속</th>
								<th scope="col">사번</th>
								<th scope="col">연락처</th>
								<th scope="col">승인/반려</th>
							</tr>
						</thead>
						<tbody  id="memberTable">
							<c:forEach items="${list}"  var="member"  varStatus="status" >
							<tr class="table-row">
								<td scope="row"> ${pager.totalRows - (pager.pageNo-1) * 10 - status.index} </td>
								<td><fmt:formatDate  value="${member.MApplydate}" pattern="yyyy-MM-dd"/></td>
								<td> ${member.MId} </td>
								<td> ${member.MName} </td>
								<td> ${member.MRole} </td>
								<td> ${member.teamName} </td>
								<td> ${member.MEmpId} </td>
								<td> ${member.MTel} </td>
								<td>
									<button type="button" class="btn btn-sm me-2" style="background-color:#003567; color:white;">승인</button>
									<button type="button" class="btn btn-sm me-2" style="background-color:#949494; color:white;">반려</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<div class="page">
	           			<a href="accountApplyList?pageNo=1" class="btn btn-outline-secondary btn-sm"><<</a>
	           			<c:if test="${pager.groupNo>1}">
	           				<a href="accountApplyList?pageNo=${pager.startPageNo-1}" class="btn btn-outline-dark btn-sm"><</a>
	           			</c:if>
	           			
	           			<c:forEach begin="${pager.startPageNo}" end="${pager.endPageNo}" step="1" var="i">
	           				<c:if test="${pager.pageNo==i}">
	           					<a href="accountApplyList?pageNo=${i}" class="btn btn-secondary btn-sm">${i}</a>
	           				</c:if>
	           				<c:if test="${pager.pageNo!=i}">
	           					<a href="accountApplyList?pageNo=${i}" class="btn btn-outline-secondary btn-sm">${i}</a>
	           				</c:if>
	           			</c:forEach>
	           			
	           			<c:if test="${pager.groupNo<pager.totalGroupNo}">
	           				<a href="accountApplyList?pageNo=${pager.endPageNo+1}" class="btn btn-outline-dark btn-sm">></a>
	           			</c:if>
	           			<a href="accountApplyList?pageNo=${pager.totalPageNo}" class="btn btn-outline-secondary btn-sm">>></a>
	           			
	           		</div>	
				</div>
			</div>
	</div>
</div> 
<script src="${pageContext.request.contextPath}/resources/js/account/accountApplyList.js"></script>
</body>
</html>