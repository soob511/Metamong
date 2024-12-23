<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB Object 시퀀스 신청내역</title>
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
						<li class="nav-item"><a class="nav-link active"
							aria-current=""
							href="${pageContext.request.contextPath}/table/tableApplyList">테이블</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/sequence/sequenceApplyList">시퀀스</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/index/indexApplyList">인덱스</a></li>
					</ul>
					<div class="d-flex justify-content-end align-items-center">
						<div class="search-box d-flex align-items-center">
							<div class="schema-filter">
								<label for="schemaSelect" class="schema-filter-label">스키마명</label>
								<select id="schemaSelect" class="form-select"
									aria-label="Default select example">
									<option value="">전체</option>
									<c:forEach items="${schemaEnum}" var="schemaEnum">
										<option value="${schemaEnum.name()}">
											${schemaEnum.name()}</option>
									</c:forEach>
								</select>
							</div>
							<div class="schema-filter">
								<label for="statusSelect" class="status-filter-label">상태</label>
								<select id="statusSelect" class="form-select"
									aria-label="Default select example">
									<option value="All" data-name="">전체</option>
									<option value="wait" data-name="0">승인대기</option>
									<option value="approve" data-name="1">승인</option>
									<option value="reject" data-name="2">반려</option>
									<option value="reflect" data-name="3">반영</option>
								</select>
							</div>
							<div class="schema-filter">
								<label for="tableNameSearch" class="table-search-label">시퀀스명/신청자</label>
								<input class="form-control" type="search"
									id="tableNameSearch" placeholder="Search" aria-label="Search">
								<button class="btn-search btn-accent">조회</button>
							</div>
						</div>
					</div>
					<div id="searchSequenceList">
						<div class="table-container">
							<table class="table table-hover">
								<thead class="table">
									<tr class="table-light">
										<th scope="col">No.</th>
										<th scope="col">신청일자</th>
										<th scope="col">신청자</th>
										<th scope="col">스키마명</th>
										<th scope="col">시퀀스명</th>
										<th scope="col">분류</th>
										<th scope="col">상세보기</th>
										<th scope="col">상태</th>
									</tr>
								</thead>
								<tbody id="searchSequenceList">
									<c:forEach items="${list}" var="seq" varStatus="status">
										<tr>
											<td scope="row">${status.index+1}</td>
											<td><fmt:formatDate value="${seq.applyDate}"
													pattern="yyyy-MM-dd" /></td>
											<td>${seq.MName}</td>
											<td>${seq.schemaName}</td>
											<td>${seq.seqName}</td>
											<td>${seq.applyType}</td>
											<td><button class="btn-history-details"
													onclick="sequenceApplyDetail(${seq.applyNo}, ${status.index + 1})">상세보기</button>
											</td>
											<td class="code-approve"><c:choose>
													<c:when test="${seq.approvalStatus == 0}">
														<span id="status-await">승인대기</span>
													</c:when>
													<c:when test="${seq.approvalStatus == 1}">
														<span id="status-approve">승인</span>
													</c:when>
													<c:when test="${seq.approvalStatus == 2}">
														<span id="status-rejected">반려</span>
													</c:when>
													<c:when test="${seq.approvalStatus == 3}">
														<span id="status-applied">반영</span>
													</c:when>
												</c:choose></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="page">
							<a href="sequenceApplyList?pageNo=1"
								class="btn btn-outline-secondary btn-sm"><<</a>
							<c:if test="${pager.groupNo>1}">
								<a href="sequenceApplyList?pageNo=${pager.startPageNo-1}"
									class="btn btn-outline-info btn-sm"><</a>
							</c:if>

							<c:forEach begin="${pager.startPageNo}" end="${pager.endPageNo}"
								step="1" var="i">
								<c:if test="${pager.pageNo==i}">
									<a href="sequenceApplyList?pageNo=${i}"
										class="btn btn-secondary btn-sm">${i}</a>
								</c:if>
								<c:if test="${pager.pageNo!=i}">
									<a href="sequenceApplyList?pageNo=${i}"
										class="btn btn-outline-secondary btn-sm">${i}</a>
								</c:if>
							</c:forEach>

							<c:if test="${pager.groupNo<pager.totalGroupNo}">
								<a href="sequenceApplyList?pageNo=${pager.endPageNo+1}"
									class="btn btn-outline-info btn-sm">></a>
							</c:if>
							<a href="sequenceApplyList?pageNo=${pager.totalPageNo}"
								class="btn btn-outline-secondary btn-sm">>></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/resources/js/dbObject/sequence/sequenceApplyList.js"></script>
</body>
</html>