<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB Object 인덱스 신청내역</title>
<link href="${pageContext.request.contextPath}/resources/css/dbObject/common/applyList.css" rel="stylesheet">

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
						<li class="nav-item"><a class="nav-link active"
							aria-current="" href="${pageContext.request.contextPath}/table/tableApplyList">테이블</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/sequence/sequenceApplyList">시퀀스</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/index/indexApplyList">인덱스</a></li>
					</ul>

					<div class="d-flex justify-content-end align-items-center">
						<div class="search-box d-flex align-items-center">
							<div class="schema-filter">
								<label for="schemaSelect" class="schema-filter-label">스키마명</label>
								<select id="schemaSelect" class="form-select"
									aria-label="Default select example">
									<c:forEach items="${schemaEnum}" var="schemaEnum">
										 <option value="${schemaEnum.name()}">
								        	<c:if test="${schemaEnum.name() == 'MAIN'}">
									        	전체
									        </c:if>
									        <c:if test="${schemaEnum.name() != 'MAIN'}">
									            ${schemaEnum.name()}
									        </c:if>
								        </option>
									</c:forEach>
								</select>
							</div>
							<div class="schema-filter">
								<label for="statusSelect" class="status-filter-label">상태</label>
								<select id="statusSelect" class="form-select"
									aria-label="Default select example">
									<option value="-1" data-name="All">전체</option>
									<option value="0" data-name="wait">승인대기</option>
									<option value="1" data-name="approve">승인</option>
									<option value="2" data-name="reject">반려</option>
									<option value="3" data-name="reflect">반영</option>
								</select>
							</div>
							<div class="schema-filter">
							<label for="indexNameSearch" class="table-search-label">인덱스명/신청자</label>
								<input class="form-control me-2" type="search"
									id="indexNameSearch" placeholder="Search" aria-label="Search">
								<i id="biSearch" class="bi bi-search"></i>
							</div>
						</div>
					</div>
					<div id="indexApplyListBody">
						<div class="table-container">
						<table class="table table-hover">
							<thead class="table">
								<tr class="table-secondary">
									<th scope="col">No.</th>
									<th scope="col">신청일자</th>
									<th scope="col">신청자</th>
									<th scope="col">스키마명</th>
									<th scope="col">인덱스명</th>
									<th scope="col">분류</th>
									<th scope="col">상세보기</th>
									<th scope="col">상태</th>
								</tr>
							</thead>
							<tbody id="indexApplyTable">
								<c:forEach items="${list}" var="index" varStatus="status">
			                  		<tr>
				                      <th>${status.index + 1}</th>
				                      <td>
				                      	<fmt:formatDate value="${index.applyDate}" pattern="yyyy-MM-dd"/>
				                      </td>
				                      <td>${index.MName}</td>
				                      <td>${index.schemaName}</td>
				                      <td>${index.idxName}</td>
				                      <td>${index.applyType}</td>
				                      	<td>
				                      		<a href="indexApplyDetail?applyNo=${index.applyNo}&indexNo=${status.index + 1}&applyType=${index.applyType}"><button class="btn-history-details">상세보기</button></a>
			                  			</td>
				                      <td>
				                      	<c:choose>
											<c:when test="${index.approvalStatus == 0}">
												<span id="status-await">승인대기</span>
											</c:when>
											<c:when test="${index.approvalStatus == 1}">
												<span id="status-approve">승인</span>
											</c:when>
											<c:when test="${index.approvalStatus == 2}">
												<span id="status-rejected">반려</span>
											</c:when>
											<c:when test="${index.approvalStatus == 3}">
												<span id="status-applied">반영</span>
											</c:when>
										</c:choose>
				                      </td>
			                    	</tr>
		                  		</c:forEach>
							</tbody>
						</table>
						</div>
						<div class="page">
			           			<a href="indexApplyList?pageNo=1" class="btn btn-outline-secondary btn-sm"><<</a>
			           			<c:if test="${pager.groupNo > 1}">
			           				<a href="indexApplyList?pageNo=${pager.startPageNo - 1}" class="btn btn-outline-dark btn-sm"><</a>
			           			</c:if>
			           			
			           			<c:forEach begin="${pager.startPageNo}" end="${pager.endPageNo}" step="1" var="i">
			           				<c:if test="${pager.pageNo == i}">
			           					<a href="indexApplyList?pageNo=${i}" class="btn btn-secondary btn-sm">${i}</a>
			           				</c:if>
			           				<c:if test="${pager.pageNo != i}">
			           					<a href="indexApplyList?pageNo=${i}" class="btn btn-outline-secondary btn-sm">${i}</a>
			           				</c:if>
			           			</c:forEach>
			           			
			           			<c:if test="${pager.groupNo<pager.totalGroupNo}">
			           				<a href="indexApplyList?pageNo=${pager.endPageNo + 1}" class="btn btn-outline-dark btn-sm">></a>
			           			</c:if>
			           			<a href="indexApplyList?pageNo=${pager.totalPageNo}" class="btn btn-outline-secondary btn-sm">>></a>
			           	</div>
		           	</div>
				</div>
			</div>
	</div>
</div> 
<script src="https://cdn.jsdelivr.net/npm/@coreui/coreui@4.0.0-beta.4/dist/js/coreui.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/dbObject/index/indexApplyList.js"></script>
</body>
</html>