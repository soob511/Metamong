<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>테이블 관리</title>
<link
	href="${pageContext.request.contextPath}/resources/css/dbObject/table/tableList.css"
	rel="stylesheet" />
</head>
<body>
	<div class="container table-list-container">
		<div class="row">
			<jsp:include page="/WEB-INF/views/common/menu.jsp" />

			<div class="col table-list-main">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />

				<div class="table-list-header">
					<p class="table-list-title">&gt; 테이블 관리</p>
				</div>


				<div class="table-list-filters">

					<div class="table-search">
						<label for="tableNameSearch" class="table-search-label">테이블명(논리/물리)</label>
						<div class="container-fluid">
							<form class="d-flex search-form">
								<input class="form-control me-2" type="search"
									id="tableNameSearch" placeholder="Search" aria-label="Search">
								<i class="bi bi-search"></i>
							</form>
						</div>
					</div>


					<div class="schema-filter">
						<label for="schemaSelect" class="schema-filter-label">스키마명</label>
						<select id="schemaSelect" class="form-select"
							aria-label="Default select example">
							<option value="All" data-name="">전체</option>
							<c:forEach items="${schemaEnum}" var="schemaEnum">
								<option value="${schemaEnum.name()}"
									data-name="${schemaEnum.getSchemaName()}">
									${schemaEnum.getSchemaName()}</option>
							</c:forEach>
						</select>
					</div>

				</div>

				<hr>

				<div class="container table-management">
					<div class="row">

						<div class="col-6 tables-table">
							<div class="tables-management">
								<p class="tables-management-title">테이블</p>
								<div class="tables-buttons">
									<a href="tableAddForm">
										<button class="btn-add">추가</button>
									</a> <a href="tableUpdateForm">
										<button class="btn-edit">수정</button>
									</a>
								</div>
							</div>
							<div class="table-contanier">
								<table class="table table-hover">
									<thead class="table-primary">
										<tr>
											<th scope="col">No.</th>
											<th scope="col">테이블(논리)</th>
											<th scope="col">테이블(물리)</th>
											<th scope="col">스키마</th>
											<th scope="col">내용</th>
										</tr>
									</thead>
									<tbody id="tableList">
										<c:forEach items="${list}" var="table" varStatus="status">
											<tr onclick="showColumnList(${table.tableNo})">
												<th>${status.index+1}</th>
												<td>${table.tableNm}</td>
												<td>${table.tableId}</td>
												<td>${table.schemaNm}</td>
												<td>${table.tableContent}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>

						<div class="col-6 column-table">
							<div class="column-management">
								<p class="column-management-title">컬럼</p>

							</div>
							<div class="column-contanier">
								<table class="table table-hover">
									<thead class="table-primary">
										<tr>
											<th scope="col">No.</th>
											<th scope="col">컬럼(논리)</th>
											<th scope="col">컬럼(물리)</th>
											<th scope="col">타입</th>
											<th scope="col">길이</th>
											<th scope="col">NULL</th>
											<th scope="col">PK</th>

										</tr>
									</thead>
									<tbody id="columnList">
										<th colspan="7">테이블을 선택해 주세요.</th>
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
		src="${pageContext.request.contextPath}/resources/js/dbObject/table/tableList.js"></script>
</body>
</html>