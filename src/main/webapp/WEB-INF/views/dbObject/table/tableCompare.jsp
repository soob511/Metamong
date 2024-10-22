<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테이블 전후비교</title>
<link href="${pageContext.request.contextPath}/resources/css/dbObject/table/tableCompare.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="row">
			<jsp:include page="/WEB-INF/views/common/menu.jsp" />
			<div class="col">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />
				<div class="container table-management">
					<div class="row">
						<div class="col-6 before-table">
								<div class="before-management">
									<p class="before-management-title">> PPRTINFO 테이블 수정전</p>
								</div>
								<div class="table-container">
									<table class="table table-hover">
										<thead class="table-primary">
											<tr>
												<th scope="col">No.</th>
												<th scope="col">항목코드</th>
												<th scope="col">컬럼(물리)</th>
												<th scope="col">타입</th>
												<th scope="col">길이</th>
												<th scope="col">NULL</th>
												<th scope="col">PK</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>재산</td>
												<td>PPRT</td>
												<td>VARCHAR2</td>
												<td>좋아요</td>
												<td>N</td>
												<td>Y</td>											
											</tr>
											<tr>
												<td>2</td>
												<td>재산</td>
												<td>PPRT</td>
												<td>VARCHAR2</td>
												<td>좋아요</td>
												<td>N</td>
												<td>Y</td>
											</tr>
											<tr>
												<td>3</td>
												<td>재산</td>
												<td>PPRT</td>
												<td>VARCHAR2</td>
												<td>좋아요</td>
												<td>N</td>
												<td>Y</td>
											</tr>
										</tbody>
									</table>
								</div>
						</div>
						<div class="col-6 after-table">
								<div class="after-management">
									<p class="after-management-title">> PPRTINFO 테이블 수정후</p>
								</div>
								<div class="table-container">
									<table class="table table-hover">
										<thead class="table-primary">
											<tr>
												<th scope="col">No.</th>
												<th scope="col">항목코드</th>
												<th scope="col">컬럼(물리)</th>
												<th scope="col">타입</th>
												<th scope="col">길이</th>
												<th scope="col">NULL</th>
												<th scope="col">PK</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>재산</td>
												<td>PPRT</td>
												<td>VARCHAR2</td>
												<td>좋아요</td>
												<td>N</td>
												<td>Y</td>
											</tr>
											<tr>
												<td>2</td>
												<td>재산</td>
												<td>PPRT</td>
												<td>VARCHAR2</td>
												<td>좋아요</td>
												<td>N</td>
												<td>Y</td>
											</tr>
											<tr>
												<td>3</td>
												<td>재산</td>
												<td>PPRT</td>
												<td>VARCHAR2</td>
												<td>좋아요</td>
												<td>N</td>
												<td>Y</td>
											</tr>
										</tbody>
									</table>
								</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/resources/js/index.js"></script>
</body>
</html>