<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>시퀀스 내역 관리</title>
<link
	href="${pageContext.request.contextPath}/resources/css/dbObject/sequence/sequenceList.css"
	rel="stylesheet" />
</head>
<body>
	<div class="container table-list-container">
		<div class="row">
			<jsp:include page="/WEB-INF/views/common/menu.jsp" />

			<div class="col sequence-list-main">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />

				<div class="sequence-list-header">
					<p class="sequence-list-title">&gt; 시퀀스 내역 관리</p>
				</div>

				<div class="sequence-list-filters">

					<div class="sequence-search">
						<label for="sequenceNameSearch" class="sequence-search-label">시퀀스명</label>
						<div class="container-fluid">
							<form class="d-flex search-form">
								<input class="form-control me-2" type="search"
									id="sequenceNameSearch" placeholder="Search" aria-label="Search">
								<i class="bi bi-search"></i>
							</form>
						</div>
					</div>


					<div class="schema-filter">
						<label for="schemaSelect" class="schema-filter-label">스키마명</label>
						<select id="schemaSelect" class="form-select"
							aria-label="Default select example">
							<option selected>선택</option>
							<option value="1">One</option>
							<option value="2">Two</option>
							<option value="3">Three</option>
						</select>
					</div>

				</div>

				<hr>

				<div class="container sequence-management">
					<div class="row">
					
						<div class="col-6 sequence-table">
							<div class="sequence-management">
								<p class="sequence-management-title">시퀀스</p>
							</div>
							<table class="table table-hover">
								<thead class="table-primary">
									<tr>
										<th scope="col">No.</th>
										<th scope="col">시퀀스명</th>
										<th scope="col">스키마명</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>1</th>
										<td>SEQ_CODE</td>
										<td>user_2024_oti_final_team1_1</td>
									</tr>
									<tr>
										<th>2</th>
										<td>SEQ_CODE</td>
										<td>user_2024_oti_final_team1_1</td>
									</tr>
									<tr>
										<th>3</th>
										<td>SEQ_CODE</td>
										<td>user_2024_oti_final_team1_1</td>
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
		src="${pageContext.request.contextPath}/resources/js/dbObject/sequence/sequenceList.js"></script>
</body>
</html>