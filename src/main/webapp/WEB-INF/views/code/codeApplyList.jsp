<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드/항목 신청내역</title>
<link
	href="${pageContext.request.contextPath}/resources/css/code/codeApplyList.css"
	rel="stylesheet">
</head>
<body>
<div class="container">
	<div class="row">
		<jsp:include page="/WEB-INF/views/common/menu.jsp" /> 
		<div class="col">
			<jsp:include page="/WEB-INF/views/common/header.jsp" />
				<div class="content">
					<div class="fw-bold code-applyList-title">> 코드/항목 신청내역</div>
					<hr>
					<div class="d-flex justify-content-end align-items-center">
						<div class="search-box d-flex align-items-center">
							<label for="codeNameSearch" class="code-search-label">코드명(논리/물리)</label>
							<form>
								<input class="form-control me-2" type="search"
									id="codeNameSearch" placeholder="Search" aria-label="Search">
								<i class="bi bi-search"></i>
							</form>
						</div>
					</div>
					<div class="table-container">
					<table class="table table-hover">
						<thead class="table">
							<tr class="table-primary">
								<th scope="col">No.</th>
								<th scope="col">신청일자</th>
								<th scope="col">신청자</th>
								<th scope="col">코드명(논리)</th>
								<th scope="col">코드명(물리)</th>
								<th scope="col">분류</th>
								<th scope="col">상세보기</th>
								<th scope="col">상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">10</th>
								<td>gilju</td>
								<td>나길주</td>
								<td>admin</td>
								<td>개발1팀</td>
								<td>20230001</td>
								<td><a href="codeApplyDetail">
										<button class="btn-history-details">상세보기</button></td>
								</a>
								<td class="code-approve">승인</td>
							</tr>
							<tr>
								<th scope="row">10</th>
								<td>gilju</td>
								<td>나길주</td>
								<td>admin</td>
								<td>개발1팀</td>
								<td>20230001</td>
								<td><a href="codeApplyDetail">
										<button class="btn-history-details">상세보기</button></td>
								</a>
								<td class="code-deny">반려</td>
							</tr>
							<tr>
								<th scope="row">10</th>
								<td>gilju</td>
								<td>나길주</td>
								<td>admin</td>
								<td>개발1팀</td>
								<td>20230001</td>
								<td><a href="codeApplyDetail">
										<button class="btn-history-details">상세보기</button></td>
								</a>
								<td class="code-await">승인대기</td>
							</tr>
							<tr>
								<th scope="row">10</th>
								<td>gilju</td>
								<td>나길주</td>
								<td>admin</td>
								<td>개발1팀</td>
								<td>20230001</td>
								<td><a href="codeApplyDetail">
										<button class="btn-history-details">상세보기</button></td>
								</a>
								<td class="code-approve">승인</td>
							</tr>
							<tr>
								<th scope="row">10</th>
								<td>gilju</td>
								<td>나길주</td>
								<td>admin</td>
								<td>개발1팀</td>
								<td>20230001</td>
								<td><a href="codeApplyDetail">
										<button class="btn-history-details">상세보기</button></td>
								</a>
								<td class="code-deny">반려</td>
							</tr>
							<tr>
								<th scope="row">10</th>
								<td>gilju</td>
								<td>나길주</td>
								<td>admin</td>
								<td>개발1팀</td>
								<td>20230001</td>
								<td><a href="codeApplyDetail">
										<button class="btn-history-details">상세보기</button></td>
								</a>
								<td class="code-await">승인대기</td>
							</tr>
						</tbody>
					</table>
					</div>
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>
				</div>
			</div>
	</div>
</div> 
<script src="${pageContext.request.contextPath}/resources/js/code/codeApplyList.js"></script>
</body>
</html>