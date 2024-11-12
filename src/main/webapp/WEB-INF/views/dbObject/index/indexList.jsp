<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>인덱스 관리</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/dbObject/index/indexList.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>
<body>
	<div id="container" class="container">
		<div class="row">
			<jsp:include page="/WEB-INF/views/common/menu.jsp" />
			<div class="col">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />
				<div id="center" class="index-container">
					<div>
						<div class="index-list-header">
							<p>&gt; 인덱스 관리</p>
						</div>
						<div class="index-manage-filters">
							<div class="schema-filter">
								<label for="schemaSelect" class="schema-filter-label">스키마명</label>
								<select id="schemaSelect" class="form-select"
									aria-label="Default select example">
									<option value="MAIN">전체</option>
									<c:forEach items="${schemaEnum}" var="schemaEnum">
										<option value="${schemaEnum.name()}">
								            ${schemaEnum.name()}
								    	</option>
									</c:forEach>
								</select>
							</div>
							<div class="table-column-filter">
								<label for="tableSelect" class="schema-filter-label">참조테이블명</label>
								<select data-detail="${tableName}" id="tableSelect" class="form-select"
									aria-label="Default select example">
									<option data-name="선택">선택</option>
								</select>
							</div>
							<div class="table-column-filter">
								<label for="columnSelect" class="schema-filter-label">참조컬럼명</label>
								<select id="columnSelect" class="form-select"
									aria-label="Default select example">
									<option data-name="선택">선택</option>
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
					<div class="index-table">
						<div class="tables-table">
							<div class="tables-management">
								<p class="tables-management-title">인덱스</p>
								<sec:authorize access="hasRole('ROLE_USER') and !hasRole('ROLE_DBA') and !hasRole('ROLE_ADMIN')">								
									<div class="tables-buttons">
										<a href="${pageContext.request.contextPath}/index/indexAddForm"><button
												class="btn-add">추가</button></a>
											<button id="btnDelete" class="btn-del">삭제</button>
									</div>
								</sec:authorize>
							</div>
							<div class="table-container">
								<table class="table table-hover">
									<thead class="table-secondary">
										<tr>
											<th scope="col"></th>
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
										
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/resources/js/dbObject/index/indexList.js"></script>
</body>
</html>