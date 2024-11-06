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
								       	<c:if test="${schemaEnum.name() != 'MAIN'}">
									        <option value="${schemaEnum.name()}">
										            ${schemaEnum.name()}
									        </option>
									    </c:if>
								    </c:forEach>
								</select>
			                </div>
			                <div class="filter">
			                  <label for="tableSelect" class="filter-label">테이블 선택</label>
			                  <select id="tableSelect" class="form-select" aria-label="select example">
			      				<option>선택</option>
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
								<div></div>
								<div class="table-container-second">
					                <table class="table table-hover">
					                  <thead class="table-primary">
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
										<tr>
										<th>1</th>
										<td>SYS_C0021765</td>
										<td>HR</td>
										<td>MEMBER</td>
										<td>M_ID</td>
					                    <td>null</td>
					                    <td>UNIQUE</td>
					                    <td>null</td>
										</tr>
										<tr>
										<th>2</th>
										<td>SYS_C0021770</td>
										<td>HR</td>
										<td>NOTICE</td>
										<td>NOTICE_ID</td>
					                    <td>null</td>
					                    <td>UNIQUE</td>
					                    <td>null</td>
										</tr></tbody>
					                </table>
			                </div>
							</div>
							<div class="col index-col-table">
								<div
									class="index-col-title d-flex justify-content-between align-items-end">
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
									<input class="index-name-title" id="indexName"></input>
									<div class="msg" id="nameValidMessage"></div>
								</div>
								<div class="index-apply-reason">
									<p>신청사유</p>
									<textarea id="indexApplyReason"></textarea>
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
		src="${pageContext.request.contextPath}/resources/js/dbObject/index/indexAddForm.js"></script>
</body>
</html>