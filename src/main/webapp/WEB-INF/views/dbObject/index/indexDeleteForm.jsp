<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>인덱스 삭제 신청</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/dbObject/index/indexDeleteForm.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<jsp:include page="/WEB-INF/views/common/menu.jsp" />
			<div class="col">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />
				<div class="index-container">
					<div>
						<div class="index-list-header">
							<p>&gt; 인덱스 삭제</p>
						</div>
						<div class="index-list-filters">
							<div class="schema-filter">
								<label for="schemaSelect" class="schema-filter-label">스키마명</label>
								<select id="schemaSelect" class="form-select"
									aria-label="Default select example">
									<c:forEach items="${schemaEnum}" var="schemaEnum">
										<option value="${schemaEnum.name()}">
											<c:if test="${schemaEnum.name() == 'MAIN'}">
									        	선택
									        </c:if>
											<c:if test="${schemaEnum.name() != 'MAIN'}">
									            ${schemaEnum.name()}
									        </c:if>
										</option>
									</c:forEach>
								</select>
							</div>
							<div class="table-column-filter">
								<label for="tableSelect" class="schema-filter-label">참조테이블명</label>
								<select id="tableSelect" class="form-select"
									aria-label="Default select example">
									<option>선택</option>
								</select>
							</div>
							<div class="table-column-filter">
								<label for="columnSelect" class="schema-filter-label">참조컬럼명</label>
								<select id="columnSelect" class="form-select"
									aria-label="Default select example">
									<option >선택</option>
								</select>
							</div>

							<div class="index-search">
								<label for="indexNameSearch" class="index-search-label">인덱스명</label>
								<div class="container-fluid">
									<div class="d-flex index-form">
										<input class="form-control" type="search" id="indexNameSearch"
											placeholder="Search" aria-label="Search"> <i
											id="biSearch" class="bi bi-search"></i>
									</div>
								</div>
							</div>
							<div class="d-flex align-items-center ms-4">
								<button class="btn-search" id="indexSearchBtn">조회</button>
							</div>
						</div>
					</div>
					<hr>
					<div class="container index-tables">
						<div class="row">
							<div class="col-7 index-table">
								<p class="index-apply-title">인덱스</p>
								<div class="table-container">
									<table class="table table-hover">
										<thead class="table-secondary">
											<tr>
												<th scope="col">
													<input class="form-check-input" type="checkbox" id="flexCheckDefault" disabled>
												</th>
												<th scope="col">No.</th>
												<th scope="col">인덱스명</th>
												<th scope="col">스키마명</th>
												<th scope="col">참조테이블명</th>
												<th scope="col">참조컬럼명</th>
												<th scope="col">컬럼순서</th>
												<th scope="col">유일성</th>
												<th scope="col">정렬</th>
												<th scope="col">PK</th>
											</tr>
										</thead>
										<tbody id="indexTableBody">
											<c:forEach items="${list}" var="index" varStatus="status">
												<tr>
													<th>
														<input class="form-check-input" type="checkbox">
													</th>
													<td>${status.index + 1}</td>
													<td data-name="idxName" data-value="${index.indexName}">
														${index.indexName}
													</td>
													<td>
								                      	<c:choose>
										                    <c:when test="${index.schemaName == 'USER_2024_OTI_FINAL_TEAM1_1'}">SPM</c:when>
										                    <c:when test="${index.schemaName == 'USER_2024_OTI_FINAL_TEAM1_2'}">PMS</c:when>
										                    <c:when test="${index.schemaName == 'USER_2024_OTI_FINAL_TEAM1_3'}">HR</c:when>
										                    <c:otherwise></c:otherwise>
										                </c:choose>
								                	</td>
													<td data-name="tableName" data-value="${index.tableName}">${index.tableName}</td>
													<td data-name="refColumn" data-value="${index.columnName}">${index.columnName}</td>
													<td data-name="columnPosition" data-value="${index.columnPosition}">${index.columnPosition}</td>
													<td data-name="isUnique" data-value="${index.uniqueness}">${index.uniqueness}</td>
													<td data-name="descend" data-value="${index.descend}">${index.descend}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<div class="col index-apply-reason">
								<p>신청사유</p>
								<textarea id="indexApplyReason"></textarea>
								<div class="msg" id="reasonValidMessage"></div>
								<button id="btnApply" class="btn-add">신청</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/resources/js/dbObject/index/indexDeleteForm.js"></script>
</body>
</html>