<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>인덱스 신청</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/dbObject/index/indexAddForm.css" />
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
			                    <option selected>선택</option>
			                    <option value="1">One</option>
			                    <option value="2">Two</option>
			                    <option value="3">Three</option>
			                  </select>
			                </div>
			                <div class="filter">
			                  <label for="tableSelect" class="filter-label">테이블 선택</label>
			                  <select id="tableSelect" class="form-select" aria-label="select example">
			                    <option selected>선택</option>
			                    <option value="1">One</option>
			                    <option value="2">Two</option>
			                    <option value="3">Three</option>
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
										<tbody>
											<tr>
												<th><input class="form-check-input" type="checkbox"
													value="" id="flexCheckChecked" checked></th>
												<td>1</td>
												<td>재산관리</td>
												<td>PPRT</td>
												<td>VARCHAR2</td>
												<td>8</td>
												<td>N</td>
												<td>Y</td>
												<td><select class="form-select"
													aria-label="Default select">
														<option selected>ASC</option>
														<option>DESC</option>
												</select></td>
											</tr>
											<tr>
												<th><input class="form-check-input" type="checkbox"
													value="" id="flexCheckChecked" checked></th>
												<td>2</td>
												<td>재산관리</td>
												<td>PPRT2</td>
												<td>VARCHAR2</td>
												<td>8</td>
												<td>N</td>
												<td>Y</td>
												<td><select class="form-select"
													aria-label="Default select">
														<option selected>ASC</option>
														<option>DESC</option>
												</select></td>
											</tr>
											<tr>
												<th><input class="form-check-input" type="checkbox"
													value="" id="flexCheckChecked"></th>
												<td>3</td>
												<td>재산관리</td>
												<td>PPRT</td>
												<td>VARCHAR2</td>
												<td>8</td>
												<td>N</td>
												<td>Y</td>
												<td><select class="form-select"
													aria-label="Default select">
														<option>ASC</option>
														<option selected>DESC</option>
												</select></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<div class="col index-col-table">
								<div
									class="index-col-title d-flex justify-content-between align-items-end">
									<div>
										<span>UNIQUE</span> <input class="form-check-input"
											type="checkbox" value="" id="flexCheckChecked">
									</div>
									<div class="index-btns">
										<button>
											<i class="bi bi-caret-up-fill"></i>
										</button>
										<button>
											<i class="bi bi-caret-down-fill"></i>
										</button>
									</div>
								</div>
								<div class="index-cols table-container">
									<table class="table table-hover">
										<thead class="table-primary">
											<tr>
												<th scope="col">No.</th>
												<th scope="col">컬럼명(물리)</th>
												<th scope="col">정렬</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>PPRT</td>
												<td>ASC</td>
												<td><i class="bi bi-trash3"></i></td>
											</tr>
											<tr>
												<td>2</td>
												<td>PPRT2</td>
												<td>ASC</td>
												<td><i class="bi bi-trash3"></i></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="index-apply-reason">
									<p>신청사유</p>
									<textarea></textarea>
									<a href="indexApplyList">
										<button class="btn-add">신청</button>
									</a>
								</div>
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