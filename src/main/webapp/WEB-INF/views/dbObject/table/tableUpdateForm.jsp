<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>테이블/컬럼 수정</title>
<link
	href="${pageContext.request.contextPath}/resources/css/dbObject/table/tableAddForm.css"
	rel="stylesheet" />
</head>
<body>
	<div class="container codeAdd-container">
		<div class="row">
			<jsp:include page="/WEB-INF/views/common/menu.jsp" />

			<div class="col codeAdd-main">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />

				<div class="codeAdd-header">
					<p class="codeAdd-title">&gt; 테이블 /컬럼 수정</p>
				</div>
				<hr>
				<div class="container">
					<div class="row">
						<div class="col code">
							<div class="codeAdd-subtitle">테이블</div>
							<table class="table table-bordered code-table">
								<tr>
									<td class="table-primary">스키마명</td>
									<td colspan="5">
											<div class="table-text">${table.schemaNm}</div>
									</td>
								</tr>
								<tr>
									<td class="table-primary">테이블(논리)</td>
									<td colspan="5">
										<div class="table-text">${table.tableNm}</div>
									</td>
								</tr>
								<tr>
									<td class="table-primary">테이블(물리)</td>
									<td colspan="5">
										<div class="table-text">${table.tableId}</div>
									</td>
								</tr>

								<tr>
									<td class="table-primary">내용</td>
									<td colspan="5"><input type="text"
										class="form-control content-input" placeholder="${table.tableContent}">
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
										class="form-control code-input"  required>
									</td>
								</tr>
								<tr>
									<td class="table-primary">컬럼(물리)</td>
									<td colspan="5"><input type="text"
										class="form-control code-input"  required>
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
										class="form-control code-input" required>
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
						<c:forEach items="${column}" var="column" varStatus="status">
							<tr>
								<th>${status.index+1}</th>
								<td>${column.colNm}</td>
								<td>${column.colId}</td>
								<td>${column.dataType}</td>
								<td>${column.colLength}</td>
								<td>${column.colIsnullable}</td>
								<td>${column.colIspk}</td>
								<td>-</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>

				<div class="button-group">
					<a href="tableApplyList">
						<div class="btn-add" type="button">신청</div>
					</a>
				</div>

				<script
					src="${pageContext.request.contextPath}/resources/js/dbObject/table/tableList.js"></script>
</body>
</html>
