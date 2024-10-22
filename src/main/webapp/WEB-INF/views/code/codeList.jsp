<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>테이블 내역 관리</title>
<link
	href="${pageContext.request.contextPath}/resources/css/code/codeList.css"
	rel="stylesheet" />
</head>
<body>
	<div class="container code-list-container">
		<div class="row">
			<jsp:include page="/WEB-INF/views/common/menu.jsp" />

			<div class="col code-list-main">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />

				<div class="code-list-header">
					<p class="code-list-title">&gt; 코드/항목 내역 관리</p>
				</div>


				<div class="code-list-filters">

					<div class="code-search">
						<label for="codeNameSearch" class="code-search-label">코드명(논리/물리)</label>
						<div class="container-fluid">
							<form class="d-flex search-form">
								<input class="form-control me-2" type="search"
									id="codeNameSearch" placeholder="Search" aria-label="Search">
								<i class="bi bi-search"></i>
							</form>
						</div>
					</div>


					<div class="use-filter">
						<label for="useSelect" class="use-filter-label">사용여부</label> <select
							id="useSelect" class="form-select"
							aria-label="Default select example">
							<option selected>선택</option>
							<option value="1">Y</option>
							<option value="2">N</option>
						</select>
					</div>

				</div>

				<hr>

				<div class="container code-management">
					<div class="row">
						<!-- 테이블 목록 -->
						<div class="col-6 code-table">
							<div class="code-management">
								<p class="code-management-title">코드</p>
								<div class="code-buttons">
									<a href="codeAddForm">
										<button class="btn-add">추가</button>
									</a> <a href="codeUpdateForm">
										<button class="btn-edit">수정</button>
									</a>
								</div>
							</div>
							<table class="table table-hover">
								<thead class="table-primary">
									<tr>
										<th scope="col">No.</th>
										<th scope="col">코드(논리)</th>
										<th scope="col">코드(물리)</th>
										<th scope="col">사용여부</th>
										<th scope="col">내용</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>1</th>
										<td>재산</td>
										<td>PRPT</td>
										<td>Y</td>
										<td>재산에관한 코드입니다.</td>
									</tr>
									<tr>
										<th>2</th>
										<td>재산</td>
										<td>PRPT</td>
										<td>Y</td>
										<td></td>
									</tr>
									<tr>
										<th>3</th>
										<td>재산</td>
										<td>PRPT</td>
										<td>Y</td>
										<td></td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="col-6 item-table">
							<div class="item-management">
								<p class="item-management-title">항목</p>

							</div>
							<table class="table table-hover">
								<thead class="table-primary">
									<tr>
										<th scope="col">No.</th>
										<th scope="col">항목코드</th>
										<th scope="col">항목명</th>
										<th scope="col">사용여부</th>
										<th scope="col">내용</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>001</th>
										<td>자동차</td>
										<td>CAR</td>
										<td>Y</td>
										<td>자동차에 관한 항목</td>
									</tr>
									<tr>
										<th>002</th>
										<td>건물</td>
										<td>building</td>
										<td>Y</td>
										<td>건물에 관한 항목</td>
									</tr>
									<tr>
										<th>003</th>
										<td>산</td>
										<td>mountain</td>
										<td>N</td>
										<td>산에 관한 항목</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="${pageContext.request.contextPath}/resources/js/code/codeList.js"></script>
</body>
</html>