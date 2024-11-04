<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드/항목 신청내역</title>
<link
	href="${pageContext.request.contextPath}/resources/css/code/codeApplyList.css"
	rel="stylesheet">
</head>
<body>
<div class="container">
	<div class="row">
		<jsp:include page="/WEB-INF/views/common/menu.jsp" /> 
		<div class="col">
			<jsp:include page="/WEB-INF/views/common/header.jsp" />
				<div class="content">
					<div class="fw-bold code-applyList-title">> 코드/항목 신청내역</div>
					<hr>
					
					<div class="d-flex justify-content-end">
						<div class="d-flex align-items-center">
							<label for="statusSelect" class="status-filter-label">상태</label>
							<select id="statusSelect" class="form-select"	 aria-label="Default select ">
								<option value="All" data-name="">전체</option>
								<option value="wait" data-name="0">승인대기</option>
								<option value="approve" data-name="1">승인</option>
								<option value="reject" data-name="2">반려</option>
								<option value="reflect" data-name="3">반영</option>
							</select>
						</div>
                    
						<div class="search-box d-flex align-items-center">
							<select id="schemaSelect" class="form-select" aria-label="Default select example">
                                <option selected>코드명(논리/물리)</option>
                                <option>신청자</option>
                            </select>
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
								<th scope="col">코드명(논리)</th>
								<th scope="col">코드명(물리)</th>
								<th scope="col">분류</th>
								<th scope="col">상세보기</th>
								<th scope="col">상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="code" varStatus="status">
								<tr>
									<th scope="row">${status.index+1}</th>
									<td>
										<fmt:formatDate value="${code.applyDate}" pattern="yyyy-MM-dd" />
									</td>
									<td>${code.MName}</td>
									<td>${code.codeNm}</td>
									<td>${code.codeId}</td>
									<td>${code.applyObj}</td>
									<td>
										<button	 class="btn-history-details" onclick="codeApplyDetail(${code.applyNo},${status.index+1})">상세보기</button>
									</td>
									<td class="code-approve"><c:choose>
											<c:when test="${code.approvalStatus == 0}">
												<span id="status-await">승인대기</span>
											</c:when>
											<c:when test="${code.approvalStatus == 1}">
												<span id="status-approve">승인</span>
											</c:when>
											<c:when test="${code.approvalStatus == 2}">
												<span id="status-rejected">반려</span>
											</c:when>
											<c:when test="${code.approvalStatus == 3}">
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
	           			<a href="codeApplyList?pageNo=1" class="btn btn-outline-primary btn-sm"><<</a>
	           			<c:if test="${pager.groupNo>1}">
	           				<a href="codeApplyList?pageNo=${pager.startPageNo-1}" class="btn btn-outline-info btn-sm"><</a>
	           			</c:if>
	           			
	           			<c:forEach begin="${pager.startPageNo}" end="${pager.endPageNo}" step="1" var="i">
	           				<c:if test="${pager.pageNo==i}">
	           					<a href="codeApplyList?pageNo=${i}" class="btn btn-outline-primary btn-sm">${i}</a>
	           				</c:if>
	           				<c:if test="${pager.pageNo!=i}">
	           					<a href="codeApplyList?pageNo=${i}" class="btn btn-outline-primary btn-sm">${i}</a>
	           				</c:if>
	           			</c:forEach>
	           			
	           			<c:if test="${pager.groupNo<pager.totalGroupNo}">
	           				<a href="codeApplyList?pageNo=${pager.endPageNo+1}" class="btn btn-outline-info btn-sm">></a>
	           			</c:if>
	           			<a href="codeApplyList?pageNo=${pager.totalPageNo}" class="btn btn-outline-primary btn-sm">>></a>
	           			
	           		</div>
					<!-- <nav aria-label="Page navigation example">
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
					</nav> -->
				</div>
			</div>
	</div>
</div> 
<script src="${pageContext.request.contextPath}/resources/js/code/codeApplyList.js"></script>
</body>
</html>