<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB Object 테이블 신청내역</title>
<link
	href="${pageContext.request.contextPath}/resources/css/dbObject/common/applyList.css"
	rel="stylesheet">

</head>
<body>
	<div class="container">
		<div class="row">
			<jsp:include page="/WEB-INF/views/common/menu.jsp" />
			<div class="col">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />
				<div class="content">
					<div class="fw-bold code-applyList-title">DB Object > 신청내역</div>
					<hr>
					<ul class="nav nav-underline">
						<li class="nav-item"><a class="nav-link" aria-current=""
							href="${pageContext.request.contextPath}/table/tableApplyList">테이블</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/sequence/sequenceApplyList">시퀀스</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/index/indexApplyList">인덱스</a></li>
					</ul>

					<div class="d-flex justify-content-end align-items-center">
						<div class="search-box d-flex align-items-center">
							<form>
								<input class="form-control me-2" type="search"
									id="codeNameSearch" placeholder="Search" aria-label="Search">
								<i class="bi bi-search"></i>
							</form>
						</div>
					</div>
					<div class="table-container">
						<table class="table table-hover">
							<thead class="table">
								<tr class="table-primary">
									<th scope="col">No.</th>
									<th scope="col">신청일자</th>
									<th scope="col">신청자</th>
									<th scope="col">스키마명</th>
									<th scope="col">테이블명</th>
									<th scope="col">분류</th>
									<th scope="col">상세보기</th>
									<th scope="col">상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="tableList" varStatus="status">
									<tr>
										<th scope="row">${status.index+1}</th>
										<td><fmt:formatDate value="${tableList.applyDate}"
											pattern="yyyy-MM-dd" /></td>
										<td>${tableList.MName}</td>
										<td>${tableList.schemaName}</td>
										<td>${tableList.tableId}</td>
										<td>${tableList.applyObj}</td>
										<td><a href="tableApplyDetail"><button
													class="btn-history-details">상세보기</button></a></td>
										<td class="code-approve"><c:choose>
												<c:when test="${tableList.approvalStatus == 0}">
													<span id="status-await">승인대기</span>
												</c:when>
												<c:when test="${tableList.approvalStatus == 1}">
													<span id="status-approve">승인</span>
												</c:when>
												<c:when test="${tableList.approvalStatus == 2}">
													<span id="status-rejected">반려</span>
												</c:when>
												<c:when test="${tableList.approvalStatus == 3}">
													<span id="status-applied">반영</span>
												</c:when>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/resources/js/dbObject/table/tableApplyList.js"></script>
</body>
</html>