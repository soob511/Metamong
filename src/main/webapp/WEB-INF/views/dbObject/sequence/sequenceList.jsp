<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>시퀀스 관리</title>
<link
	href="${pageContext.request.contextPath}/resources/css/dbObject/sequence/sequenceList.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>
<body>
	<div class="container table-list-container">
		<div class="row">
			<jsp:include page="/WEB-INF/views/common/menu.jsp" />

			<div class="col sequence-list-main">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />

				<div class="sequence-list-header">
					<p class="sequence-list-title">&gt; 시퀀스 관리</p>
				</div>

				<div class="sequence-list-filters">
					<!-- 스키마 필터 -->
					<div class="schema-filter">
						<label for="schemaSelect" class="schema-filter-label">스키마명</label>
						<select id="schemaSelect" class="form-select"
							aria-label="Default select example">
							<option value="">전체</option>
							<c:forEach items="${schemaEnum}" var="schemaEnum">
								<option value="${schemaEnum.name()}">
									${schemaEnum.name()}</option>
							</c:forEach>
						</select>
					</div>
					<!-- 시퀀스 검색 영역 -->
					<div class="sequence-search">
						<label for="sequenceNameSearch" class="sequence-search-label">시퀀스명</label>
						<div class="container-fluid">
							<form class="d-flex search-form">
								<input class="form-control" type="search"
									id="sequenceNameSearch" placeholder="Search"
									aria-label="Search">
									<button class="btn-search btn-accent">조회</button>
							</form>
						</div>
					</div>

				</div>

				<hr>

				<div class="container sequence-management">
					<!-- 시퀀스 목록 -->
					<div class="sequence-table">
						<div
							class="sequence-management-header d-flex justify-content-between align-items-center">
							<p class="sequence-management-title">시퀀스</p>
							<sec:authorize
								access="hasRole('ROLE_USER') and !hasRole('ROLE_DBA')">
								<button class="btn-apply" data-bs-toggle="modal"
									data-bs-target="#sequenceApplyModal">생성/삭제</button>
							</sec:authorize>
						</div>
						<div class="sequence-list-table table-container">
							<table class="table sequence-list table-hover">
								<thead class="table-light">
									<tr>
										<th scope="col">No.</th>
										<th scope="col">스키마명</th>
										<th scope="col">시퀀스명</th>
										<th scope="col">최솟값</th>
										<th scope="col">최댓값</th>
										<th scope="col">증감값</th>
										<th scope="col">현재값</th>
									</tr>
								</thead>
								<tbody id="searchSequenceList">
									<c:forEach items="${sequence}" var="sequence"
										varStatus="status">
										<tr>
											<td>${status.index+1}</td>
											<td>${sequence.schemaName}</td>
											<td>${sequence.sequenceName}</td>
											<td>${sequence.minValue}</td>
											<td>${sequence.maxValue}</td>
											<td>${sequence.incrementBy}</td>
											<td>${sequence.lastNumber}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>




					<div class="modal fade" id="sequenceApplyModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="sequence-create-delete-title">시퀀스 생성/삭제</h4>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
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
												<c:forEach items="${schemaEnum}" var="schemaEnum">
													<option value="${schemaEnum.name()}">
														${schemaEnum.name()}</option>
												</c:forEach>
											</select>
										</div>
										<div class="type-input-group">
											<label for="typeInput" class="type-input-label">신청종류</label>
											<select id="typeInput" class="form-select"
												aria-label="Default select example">
												<option value="CREATE">생성</option>
												<option value="DROP">삭제</option>
											</select>
										</div>
										<div class="input-group">
											<label for="seqReason" class="input-label">신청사유</label>
											<textarea class="form-control" id="seqReason"
												aria-label="seqReason" aria-describedby="seqReason" rows="4"
												style="resize: none;"></textarea>
										</div>


										<div class="input-group mb-3 file-upload-group">
											<label class="input-file-label">파일업로드</label> <input
												type="file" class="form-control" id="inputGroupFile">
										</div>


									</div>
								</div>

								<div class="modal-footer">
									<button type="button" class="btn-apply" id="sequenceApply">신청</button>
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
