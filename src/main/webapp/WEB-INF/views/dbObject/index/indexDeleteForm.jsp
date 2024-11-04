<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>인덱스 삭제 신청</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/dbObject/index/indexDeleteForm.css" />
</head>
<body>
	<div class="container">
		<div class="row">
			<jsp:include page="/WEB-INF/views/common/menu.jsp" />
			<div class="col">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />
				<div class="index-container">
					<div>
						<div class="table-list-header">
							<p class="table-list-title">&gt; 인덱스 삭제</p>
						</div>
						<div class="table-list-filters">
							<div class="schema-filter">
								<label for="schemaSelect" class="schema-filter-label">스키마명</label>
								<select id="schemaSelect" class="form-select"
									aria-label="Default select example">
									<option value="ALL">전체</option>
								    <c:forEach items="${schemaEnum}" var="schemaEnum">
								        <option value="${schemaEnum.name()}">${schemaEnum.name()}</option>
								    </c:forEach>
								</select>
							</div>
							<div class="table-search">
								<label for="indexNameSearch" class="table-search-label">인덱스명</label>
								<div class="container-fluid">
									<form class="d-flex search-form">
										<input class="form-control" type="search"
											id="indexNameSearch" placeholder="Search" aria-label="Search">
										<i id="bisearch" class="bi bi-search"></i>
									</form>
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
										<thead class="table-primary">
											<tr>
												<th scope="col"><input class="form-check-input"
													type="checkbox" id="flexCheckDefault"></th>
												<th scope="col">No.</th>
												<th scope="col">인덱스명</th>
												<th scope="col">스키마명</th>
												<th scope="col">참조테이블명</th>
												<th scope="col">참조컬럼명</th>
												<th scope="col">유일성</th>
											</tr>
										</thead>
										<tbody id="indexTableBody">
											<c:forEach items="${list}" var="index" varStatus="status">
						                  		<tr>
						                  			<th>
														<input class="form-check-input" type="checkbox">
													</th>
							                      	<th>${status.index + 1}</th>
							                      	<td data-name="idxName" data-value="${index.indexName}">${index.indexName}</td>
													<td data-name="schemaName" data-value="${index.schemaName}">${index.schemaName}</td>
													<td data-name="tableNo" data-value="${index.tableName}">${index.tableName}</td>
													<td data-name="refColumn" data-value="${index.columnName}">${index.columnName}</td>
													<td data-name="isUnique" data-value="${index.uniqueness}">${index.uniqueness}</td>
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