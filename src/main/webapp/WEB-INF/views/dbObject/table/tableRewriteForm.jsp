<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>테이블/컬럼 생성</title>
<link
	href="${pageContext.request.contextPath}/resources/css/dbObject/table/tableAddForm.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/css/dbObject/common/codeModal.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

</head>
<body>
	<div class="container codeAdd-container">
		<div class="row">
			<jsp:include page="/WEB-INF/views/common/menu.jsp" />

			<div class="col codeAdd-main">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />

				<div class="codeAdd-header">
					<p class="codeAdd-title">&gt; 테이블 /컬럼 생성</p>
				</div>
				<hr>
				<div class="container">
					<div class="row">
						<div class="col code">
							<div class="codeAdd-subtitle">테이블</div>
							<table class="table table-bordered code-table">
								<tr>
									<td class="table-secondary">스키마명</td>
									<td colspan="5"><select id="schemaSelect"
										class="form-select" aria-label="스키마명">
											<c:forEach items="${schemaEnum}" var="schemaEnum">
												<option value="${schemaEnum.name()}"
													data-name="${schemaEnum.name()}"
													<c:if test="${schemaEnum.name() == table.schemaName}">selected</c:if>>
													${schemaEnum.name()}</option>
											</c:forEach>
									</select></td>
								</tr>
								<tr>
									<td class="table-secondary">테이블(논리)</td>
									<td colspan="5"><input type="text" id="tableNm"
										class="form-control code-input" placeholder="내용 입력"
										value="${table.tableNm}"></td>
								</tr>
								<tr>
									<td class="table-secondary">테이블(물리)</td>
									<td colspan="5"><input type="text" id="tableId"
										class="form-control code-input" placeholder="내용 입력"
										value="${table.tableId}"></td>
								</tr>
								<tr>
									<td class="table-secondary">내용</td>
									<td colspan="5"><input type="text" id="tableContent"
										class="form-control content-input" placeholder="내용 입력"
										value="${table.tableContent}"></td>
								</tr>
								<tr>
									<td class="table-secondary">신청사유</td>
									<td colspan="5"><input type="text" id="applyReason"
										class="form-control content-input" placeholder="내용 입력"
										value="${table.applyReason}"></td>
								</tr>

							</table>
						</div>

						<div class="col item">
							<form id="itemForm">
								<div class="btn-load-container">
									<div class="itemAdd-subtitle">컬럼</div>
									<div class="right-btn">
										<div class="btn-load" data-bs-toggle="modal"
											data-bs-target="#codeLoadModal" type="button">불러오기</div>
										<div class="btn-reset" type="button">초기화</div>
									</div>
								</div>
								<table class="table table-bordered item-table">
									<tr>
										<td class="table-secondary">컬럼(논리)</td>
										<td colspan="5"><input type="text" id="colNm"
											class="form-control code-input" placeholder="내용 입력" required>
										</td>
									</tr>
									<tr>
										<td class="table-secondary">컬럼(물리)</td>
										<td colspan="5"><input type="text" id="colId"
											class="form-control code-input" placeholder="내용 입력" required>
										</td>
									</tr>

									<tr>
										<td class="table-secondary">데이터타입</td>
										<td colspan="5"><select type="text" id="dataType"
											class="form-select use-status-select" aria-label="사용 여부 선택">

										</select></td>
									</tr>
									<tr>
										<td class="table-secondary">길이</td>
										<td colspan="5"><input type="text" id="dataLength"
											class="form-control code-input" placeholder="내용 입력" required>
										</td>
									</tr>

									<tr>
										<td class="table-secondary">NULL</td>
										<td colspan="5"><select id="nullable"
											class="form-select use-status-select" aria-label="사용 여부 선택">
												<option value="NULL">NULL</option>
												<option value="NOTNULL">NOTNULL</option>
										</select></td>
									</tr>
									<tr>
										<td class="table-secondary">PK</td>
										<td colspan="5"><select id="isUse"
											class="form-select use-status-select" aria-label="사용 여부 선택">
												<option value="N">N</option>
												<option value="Y">Y</option>
										</select></td>
									</tr>
								</table>
							</form>


						</div>
					</div>

				</div>
				<div class="button-group">
					<div class="btn-add" type="button">추가</div>
					<button class="btn-update" type="button">수정</button>
				</div>


				<div class="item-container">
					<div class="item-icon">
						<div class="item-header">컬럼</div>
						<div class="index-btns">
							<button id="move-up">
								<i class="bi bi-caret-up-fill"></i>
							</button>
							<button id="move-down">
								<i class="bi bi-caret-down-fill"></i>
							</button>
						</div>

					</div>
					<div id="item-background">
						<table class="table table-hover bottom-table">
							<thead class="table-secondary">
								<tr>
									<th scope="col">No.</th>
									<th scope="col">컬럼(논리)</th>
									<th scope="col">컬럼(물리)</th>
									<th scope="col">타입</th>
									<th scope="col">길이</th>
									<th scope="col">NULL</th>
									<th scope="col">PK</th>
									<th></th>
								</tr>
							</thead>
							<tbody id="columnList">
								<c:forEach items="${column}" var="column" varStatus="status">
									<tr>
										<td>${status.index+1}</td>
										<td>${column.colNm}</td>
										<td>${column.colId}</td>
										<td>${column.dataType}</td>
										<td>${column.colLength}</td>
										<td>${column.colIsnullable == 1 ? 'NULL' : 'NOTNULL'}</td>
										<td>${column.colIspk == 1 ? 'Y' : 'N'}</td>
										<td><i class="bi bi-trash3 delete-row"></i></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="button-group">
					<div class="btn-apply" type="button">신청</div>
				</div>

				<div class="modal fade" id="codeLoadModal" tabindex="-1"
					aria-labelledby="codeLoadModal" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>

							<div class="d-flex align-items-center">
								<label for="codeNameSearch" class="code-search-label">코드명(논리/물리)</label>
								<div>
									<form class="d-flex search-form">
										<input class="form-control" type="search" id="codeNameSearch"
											placeholder="Search" aria-label="Search"> <i
											class="bi bi-search"></i>
									</form>
								</div>
							</div>

							<div class="modal-body">
								<div class="table-container">
									<table class="table table-hover">
										<thead class="table">
											<tr class="table-secondary">
												<th scope="col">No.</th>
												<th scope="col">코드(논리)</th>
												<th scope="col">코드(물리)</th>
												<th scope="col">길이</th>
												<th scope="col">내용</th>
											</tr>
										</thead>
										<tbody id="codeList">

										</tbody>
									</table>
								</div>
							</div>

						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/resources/js/dbObject/table/tableAddForm.js"></script>
</body>
</html>