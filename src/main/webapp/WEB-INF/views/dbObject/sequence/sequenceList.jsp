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
					<!-- 시퀀스 검색 영역 -->
					<div class="sequence-search">
						<label for="sequenceNameSearch" class="sequence-search-label">시퀀스명</label>
						<div class="container-fluid">
							<form class="d-flex search-form">
								<input class="form-control me-2" type="search"
									id="sequenceNameSearch" placeholder="Search"
									aria-label="Search"> <i class="bi bi-search"></i>
							</form>
						</div>
					</div>

					<!-- 스키마 필터 -->
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
						<!-- 시퀀스 목록 -->
						<div class="sequence-table">
							<div class="sequence-management-header d-flex justify-content-between align-items-center">
								<p class="sequence-management-title">시퀀스</p>
								<button class="btn-apply" data-bs-toggle="modal" data-bs-target="#sequenceApplyModal" >생성/삭제</button>
							</div>
							<div class="sequence-list-table">
							<table class="table sequence-list table-hover">
								<thead class="table-primary">
									<tr>
										<th scope="col">No.</th>
										<th scope="col">시퀀스명</th>
										<th scope="col">스키마명</th>
										<th scope="col">최솟값</th>
										<th scope="col">최댓값</th>
										<th scope="col">증감값</th>
										<th scope="col">현재값</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th>1</th>
										<td>SEQ_CODE</td>
										<td>user_2024_oti_final_team1_1</td>
										<td>1</td>
										<td>9999</td>
										<td>1</td>
										<td>27</td>
									</tr>
									<tr>
										<th>2</th>
										<td>SEQ_CODE</td>
										<td>user_2024_oti_final_team1_1</td>
										<td>1</td>
										<td>9999</td>
										<td>1</td>
										<td>27</td>
									</tr>
									<tr>
										<th>3</th>
										<td>SEQ_CODE</td>
										<td>user_2024_oti_final_team1_1</td>
										<td>1</td>
										<td>9999</td>
										<td>1</td>
										<td>27</td>
									</tr>
								</tbody>
							</table>
						</div>
						</div>

					
						
						
				<div class="modal fade" id="sequenceApplyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<p class="sequence-create-delete-title">시퀀스 생성/삭제</p>
								<button type="button" class="btn-close" data-bs-dismiss="modal"	aria-label="Close"></button>
							</div>							

							<div class="modal-body">
								<div class="col sequence-create-delete">

						
								<div class="input-group">
									<label for="seqName" class="input-label">시퀀스명</label> <input
										type="text" class="form-control" id="seqName"
										aria-label="seqName" aria-describedby="seqName">
								</div>

								<div class="schema-input-group">
									<label for="schemaInput" class="schema-input-label">스키마명</label>
									<select id="schemaInput" class="form-select"
										aria-label="Default select example">
										<option selected>선택</option>
										<option value="1">One</option>
										<option value="2">Two</option>
										<option value="3">Three</option>
									</select>
								</div>

								<div class="input-group">
									<label for="seqReason" class="input-label">신청사유</label> <input
										type="text" class="form-control" id="seqReason"
										aria-label="seqReason" aria-describedby="seqReason">
								</div>

								<div class="input-group mb-3 file-upload-group">
									<label class="input-file-label">파일업로드</label> <input
										type="file" class="form-control" id="inputGroupFile">
								</div>

							
						</div>
							</div>

							<div class="modal-footer">
								<button type="button" class="btn-apply" data-bs-dismiss="modal">신청</button>
							</div>
						</div>
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
