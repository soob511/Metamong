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
			                  		<option>선택</option>
									<c:forEach items="${schemaEnum}" var="schemaEnum">
								        <option value="${schemaEnum.name()}"
								        	<c:if test="${schemaEnum.name() == schemaName}"> selected</c:if>
								        >
								            ${schemaEnum.name()}
								        </option>
								    </c:forEach>
								</select>
			                </div>
			                <div class="filter">
			                  <label for="tableSelect" class="filter-label">참조테이블 선택</label>
			                  <select id="tableSelect" class="form-select" aria-label="select example">
			      				<option value="${table.tableNo}" data-name="${table.tableId}">
			      					${table.tableId}
			      				</option>
			                  </select>
			                </div>
			              </div>
					</div>
					<hr>
					<div class="container index-tables">
						<div class="row">
							<div class="col-7 index-table">
								<p class="index-apply-title">컬럼</p>
								<div class="column-container">
									<table class="table table-hover">
										<thead class="table-secondary">
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
											<c:forEach items="${list}" var="column" varStatus="status">
												<tr data-value="${column.colId}">
													<th><input class="form-check-input" type="checkbox"
														value=""></th>
													<td>${status.index + 1}</td>
													<td>${column.colNm}</td>
													<td data-name="colId" data-value="${column.colId}">${column.colId}</td>
													<td>${column.dataType}</td>
													<td>${column.colLength}</td>
													<td>${column.colIsnullableText}</td>
													<td>${column.colIspkText}</td>
													<td data-name="colOrder"><select class="form-select"
														aria-label="Default select">
															<option selected>ASC</option>
															<option>DESC</option>
													</select></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div></div>
								<div class="index-info-container">
					                <table class="table">
					                  <thead class="table-secondary">
					                    <tr>
					                      <th scope="col">No.</th>
					                      <th scope="col">인덱스명</th>
					                      <th scope="col">스키마명</th>
					                      <th scope="col">참조테이블명</th>
					                      <th scope="col">참조컬럼명</th>
					                      <th scope="col">컬럼순서</th>
					                      <th scope="col">유일성</th>
					                      <th scope="col">정렬</th>
					                    </tr>
					                  </thead>
					                  	<tbody id="indexTableBody">
										
										</tbody>
					                </table>
			                </div>
							</div>
							<div class="col selected-column-area">
								<div
									class="selected-column-title d-flex justify-content-between align-items-end">
									<div>
										<span>UNIQUE</span> <input class="form-check-input"
											type="checkbox" id="uniqueCheckBox">
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
								<div class="selected-column-container">
									<table class="table">
										<thead class="table-secondary">
											<tr>
												<th scope="col">No.</th>
												<th>컬럼명(물리)</th>
												<th>정렬</th>
												<th>삭제</th>
											</tr>
										</thead>
										<tbody id="indexApplyColumn">
											
										</tbody>
									</table>
								</div>
								
								<div class="index-apply-reason">
									<p>인덱스이름</p>
									<input class="index-name-title" id="indexName" value="${applyIndexDetail.idxName}"/>
									<div class="msg" id="nameValidMessage"></div>
								</div>
								<div class="index-apply-reason">
									<p>신청사유</p>
									<textarea id="indexApplyReason">${applyIndexDetail.applyReason}</textarea>
									<div class="msg" id="reasonValidMessage"></div>
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
		src="${pageContext.request.contextPath}/resources/js/dbObject/index/indexAddFormReApply.js"></script>
</body>
</html>