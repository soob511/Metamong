<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>인덱스 신청</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/dbObject/index/indexAddForm.css" />
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
						<div class="table-list-header">
							<p class="table-list-title">&gt; 인덱스 신청</p>
						</div>
						<div class="list-filters">
			                <div class="filter">
			                  <label for="schemaSelect" class="filter-label">스키마 선택</label>
			                  	<select id="schemaSelect" class="form-select" aria-label="select example">
									<c:forEach items="${schemaEnum}" var="schemaEnum">
										<c:if test="${schemaEnum.getSchemaName() != '전체'}">
											<option value="${schemaEnum.name()}">${schemaEnum.getSchemaName()}</option>										
										</c:if>
									</c:forEach>
								</select>
			                </div>
			                <div class="filter">
			                  <label for="tableSelect" class="filter-label">테이블 선택</label>
			                  <select id="tableSelect" class="form-select" aria-label="select example">
			      				
			                  </select>
			                </div>
			              </div>
					</div>
					<hr>
					<div class="container index-tables">
						<div class="row">
							<div class="col-7 index-table">
								<p class="index-apply-title">컬럼</p>
								<div class="table-container">
									<table class="table table-hover">
										<thead class="table-primary">
											<tr>
												<th scope="col"><input class="form-check-input"
													type="checkbox" value="" id="flexCheckDefault"></th>
												<th scope="col">No.</th>
												<th scope="col">컬럼(논리)</th>
												<th scope="col">컬럼(물리)</th>
												<th scope="col">타입</th>
												<th scope="col">길이</th>
												<th scope="col">NULL</th>
												<th scope="col">PK</th>
												<th scope="col">정렬</th>
											</tr>
										</thead>
										<tbody id="columnTableBody">
											
										</tbody>
									</table>
								</div>
							</div>
							<div class="col index-col-table">
								<div
									class="index-col-title d-flex justify-content-between align-items-end">
									<div>
										<span>UNIQUE</span> <input class="form-check-input"
											type="checkbox" value="1" id="uniqueCheckBox">
									</div>
									<div class="index-btns">
										<button id="upButton">
											<i class="bi bi-caret-up-fill"></i>
										</button>
										<button id="downButton">
											<i class="bi bi-caret-down-fill"></i>
										</button>
									</div>
								</div>
								<div class="index-cols table-container index-apply-table">
									<table class="table table-hover">
										<thead class="table-primary">
											<tr>
												<th scope="col">No.</th>
												<th scope="col">컬럼명(물리)</th>
												<th scope="col">정렬</th>
												<th></th>
											</tr>
										</thead>
										<tbody id="indexApplyColumn">
											
										</tbody>
									</table>
								</div>
								
								<div class="index-apply-reason">
									<p>인덱스제목</p>
									<textarea class="index-apply-reason-title" id="indexName"></textarea>
								</div>
								<div class="index-apply-reason">
									<p>신청사유</p>
									<textarea id="indexApplyReason"></textarea>
									<!-- <a href="indexApplyList">
									</a> -->
									<div class="d-flex justify-content-end">
										<button id="btn-apply" class="btn-add">
											신청
										</button>									
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/resources/js/dbObject/index/indexAddForm.js"></script>
</body>
</html>