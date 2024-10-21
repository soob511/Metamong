<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>codeContrast</title>
<link
	href="${pageContext.request.contextPath}/resources/css/code/codeContrast.css"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="row">
			<jsp:include page="/WEB-INF/views/common/menu.jsp" />
			<div class="col">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />
				<div class="container table-management">
					<div class="row">
						<div class="col-6 tables-table">
							
								<div class="tables-management">
									<p class="tables-management-title">> PPRTINFO 코드 수정전</p>

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
											<td>1</td>
											<td>재산</td>
											<td>PPRT</td>
											<td>Y</td>
											<td>좋아요</td>
										</tr>
										<tr>
											<td>1</td>
											<td>재산</td>
											<td>PPRT</td>
											<td>Y</td>
											<td>좋아요</td>
										</tr>
										<tr>
											<td>1</td>
											<td>재산</td>
											<td>PPRT</td>
											<td>Y</td>
											<td>좋아요</td>
										</tr>
									</tbody>
								</table>
							
						</div>

						<div class="col-6 column-table">
							
								<div class="column-management">
									<p class="column-management-title">> PPRTINFO 코드 수정후</p>

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
											<td>1</td>
											<td>재산</td>
											<td>PPRT</td>
											<td>Y</td>
											<td>좋아요</td>
										</tr>
										<tr>
											<td>1</td>
											<td>재산</td>
											<td>PPRT</td>
											<td>Y</td>
											<td>좋아요</td>
										</tr>
										<tr>
											<td>1</td>
											<td>재산</td>
											<td>PPRT</td>
											<td>Y</td>
											<td>좋아요</td>
										</tr>
									</tbody>
								</table>
							
						</div>



					</div>

				</div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/resources/js/index.js"></script>
</body>
</html>