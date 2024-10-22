<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>코드/항목 수정</title>
<link
	href="${pageContext.request.contextPath}/resources/css/code/codeAddForm.css"
	rel="stylesheet" />
</head>
<body>
	<div class="container codeAdd-container">
		<div class="row">
			<jsp:include page="/WEB-INF/views/common/menu.jsp" />

			<div class="col codeAdd-main">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />

				<div class="codeAdd-header">
					<p class="codeAdd-title">&gt; 코드/항목 수정</p>
				</div>
				<hr>
				<div class="container">
					<div class="row">
						<div class="col code">
							<div class="codeAdd-subtitle">코드</div>
							<table class="table table-bordered code-table">
								<tr>
									<td class="table-primary">코드명(논리)</td>
									<td colspan="5"><input type="text"
										class="form-control code-input" placeholder="재산정보" required>
									</td>
								</tr>
								<tr>
									<td class="table-primary">코드명(물리)</td>
									<td colspan="5"><input type="text"
										class="form-control code-input" placeholder="PRPTINFO"
										required></td>
								</tr>
								<tr>
									<td class="table-primary">내용</td>
									<td colspan="5"><input type="text"
										class="form-control content-input"
										placeholder="개인의 재산정보에 대한 코드"></td>
								</tr>
								<!-- 사용여부 추가 -->
								<tr>
									<td class="table-primary">사용여부</td>
									<td colspan="5"><select
										class="form-select use-status-select" aria-label="사용 여부 선택">
											<option value="Y">Y</option>
											<option value="N">N</option>
									</select></td>
								</tr>
							</table>
						</div>

						<div class="col item">
							<div class="itemAdd-subtitle">항목</div>
							<table class="table table-bordered item-table">
								<tr>
									<td class="table-primary">항목코드</td>
									<td colspan="5"><input type="text"
										class="form-control code-input" placeholder="01" required>
									</td>
								</tr>
								<tr>
									<td class="table-primary">항목명</td>
									<td colspan="5"><input type="text"
										class="form-control code-input" placeholder="자동차" required>
									</td>
								</tr>
								<tr>
									<td class="table-primary">내용</td>
									<td colspan="5"><input type="text"
										class="form-control content-input" placeholder="자동차에 관한 항목">
									</td>
								</tr>
								<tr>
									<td class="table-primary">사용여부</td>
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
					<div class="btn-add" type="button">추가/수정</div>
				</div>


				<div class="item-container">
					<div class="item-header">항목</div>
					<table class="table table-hover bottom-table">
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

				<div class="button-group">
					<a href="codeApplyList">
						<div class="btn-add" type="button">신청</div>
					</a>
				</div>

				<script
					src="${pageContext.request.contextPath}/resources/js/code/codeList.js"></script>
</body>
</html>
