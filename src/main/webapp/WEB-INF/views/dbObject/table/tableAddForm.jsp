<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
									<td class="table-primary">스키마명</td>
									<td colspan="5"><select
										class="form-select use-status-select" aria-label="스키마명">
											<option value="oti_user1">oti_user1</option>
											<option value="oti_user2">oti_user2</option>
									</select></td>
								</tr>
								<tr>
									<td class="table-primary">테이블(논리)</td>
									<td colspan="5"><input type="text"
										class="form-control code-input" placeholder="내용 입력" required>
									</td>
								</tr>
								<tr>
									<td class="table-primary">테이블(물리)</td>
									<td colspan="5"><input type="text"
										class="form-control code-input" placeholder="내용 입력" required>
									</td>
								</tr>
								<tr>
									<td class="table-primary">신청사유</td>
									<td colspan="5"><input type="text"
										class="form-control content-input" placeholder="내용 입력">
									</td>
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
										<td class="table-primary">컬럼(논리)</td>
										<td colspan="5"><input type="text"
											class="form-control code-input" placeholder="내용 입력" required>
										</td>
									</tr>
									<tr>
										<td class="table-primary">컬럼(물리)</td>
										<td colspan="5"><input type="text"
											class="form-control code-input" placeholder="내용 입력" required>
										</td>
									</tr>
									<tr>
										<td class="table-primary">데이터타입</td>
										<td colspan="5"><select
											class="form-select use-status-select" aria-label="사용 여부 선택">
												<option value="VARCHAR2">VARCHAR2</option>
												<option value="NUMBER">NUMBER</option>
										</select></td>
									</tr>
									<tr>
										<td class="table-primary">길이</td>
										<td colspan="5"><input type="text"
											class="form-control code-input" placeholder="내용 입력" required>
										</td>
									</tr>

									<tr>
										<td class="table-primary">NULL</td>
										<td colspan="5"><select
											class="form-select use-status-select" aria-label="사용 여부 선택">
												<option value="NULL">NULL</option>
												<option value="NOTNULL">NOTNULL</option>
										</select></td>
									</tr>
									<tr>
										<td class="table-primary">PK</td>
										<td colspan="5"><select
											class="form-select use-status-select" aria-label="사용 여부 선택">
												<option value="Y">Y</option>
												<option value="N">N</option>
										</select></td>
									</tr>
								</table>
							</form>


						</div>
					</div>

				</div>
				<div class="button-group">
					<div class="btn-add" type="button">추가</div>
					<div class="btn-update" type="button">수정</div>
				</div>

				<div class="item-container">
					<div class="item-icon">
						<div class="item-header">컬럼</div>
						<div class="index-btns">
							<button>
								<i class="bi bi-caret-up-fill"></i>
							</button>
							<button>
								<i class="bi bi-caret-down-fill"></i>
							</button>
						</div>

					</div>
					<table class="table table-hover bottom-table">
						<thead class="table-primary">
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
						<tbody>
							<tr>
								<th>1</th>
								<td>재산구분</td>
								<td>PRPT_FG</td>
								<td>VARCHAR2</td>
								<td>2</td>
								<td>NOTNULL</td>
								<td>Y</td>
								<td><i class="bi bi-trash3"></i></td>
							</tr>
							<tr>
								<th>2</th>
								<td>재산구분</td>
								<td>PRPT_FG</td>
								<td>VARCHAR2</td>
								<td>2</td>
								<td>NOTNULL</td>
								<td>Y</td>
								<td><i class="bi bi-trash3"></i></td>
							</tr>
							<tr>
								<th>3</th>
								<td>재산구분</td>
								<td>PRPT_FG</td>
								<td>VARCHAR2</td>
								<td>2</td>
								<td>NOTNULL</td>
								<td>Y</td>
								<td><i class="bi bi-trash3"></i></td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="button-group">
					<a href="tableApplyList">
						<div class="btn-add" type="button">신청</div>
					</a>
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
											<tr class="table-primary">
												<th scope="col">No.</th>
												<th scope="col">코드(논리)</th>
												<th scope="col">코드(물리)</th>
												<th scope="col">내용</th>
											</tr>
										</thead>
										<tbody id="codeList">
											
										</tbody>
									</table>
								</div>
							</div>

							<div class="modal-footer">
								<button type="button" class="btn-select" data-bs-dismiss="modal">확인</button>
							</div>
						</div>
					</div>
				</div>

				<script
					src="${pageContext.request.contextPath}/resources/js/dbObject/table/tableAddForm.js"></script>
</body>
</html>
