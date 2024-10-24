<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB Object 시퀀스 신청내역</title>
<link href="${pageContext.request.contextPath}/resources/css/dbObject/common/applyList.css" rel="stylesheet">

</head>
<body>
<div class="container">
	<div class="row">
		<jsp:include page="/WEB-INF/views/common/menu.jsp" /> 
		<div class="col">
			<jsp:include page="/WEB-INF/views/common/header.jsp" />
				<div class="content">
					<div class="fw-bold code-applyList-title">DB Object > 신청내역</div>
					<hr>
					<ul class="nav nav-underline">
						<li class="nav-item"><a class="nav-link active"
							aria-current="" href="${pageContext.request.contextPath}/table/tableApplyList">테이블</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/sequence/sequenceApplyList">시퀀스</a></li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/index/indexApplyList">인덱스</a></li>
					</ul>

					<div class="d-flex justify-content-end align-items-center">						
						<div class="search-box d-flex align-items-center">
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
									<th scope="col">스키마명</th>
									<th scope="col">시퀀스명</th>
									<th scope="col">분류</th>
									<th scope="col">상세보기</th>
									<th scope="col">상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">1</th>
									<td>2023-10-13</td>
									<td>나길주</td>
									<td>kosa_oti_team_1</td>
									<td>notice_id</td>
									<td>시퀀스</td>
									<td><a href="${pageContext.request.contextPath}/sequence/sequenceApplyDetail"><button class="btn-history-details">상세보기</button></a></td>
									<td class="code-approve">승인</td>
								</tr>
								<tr>
									<th scope="row">10</th>
									<td>2023-10-13</td>
									<td>나길주</td>
									<td>kosa_oti_team_1</td>
									<td>notice_id</td>
									<td>시퀀스</td>
									<td><a href="${pageContext.request.contextPath}/sequence/sequenceApplyDetail"><button class="btn-history-details">상세보기</button></a></td>
									<td class="code-deny">반려</td>
								</tr>
								<tr>
									<th scope="row">2</th>
									<td>2023-10-13</td>
									<td>나길주</td>
									<td>kosa_oti_team_1</td>
									<td>notice_id</td>
									<td>시퀀스</td>
									<td><a href="${pageContext.request.contextPath}/sequence/sequenceApplyDetail"><button class="btn-history-details">상세보기</button></a></td>
									<td class="code-await">승인대기</td>
								</tr>
								<tr>
									<th scope="row">3</th>
									<td>2023-10-13</td>
									<td>나길주</td>
									<td>kosa_oti_team_1</td>
									<td>notice_id</td>
									<td>시퀀스</td>
									<td><a href="${pageContext.request.contextPath}/sequence/sequenceApplyDetail"><button class="btn-history-details">상세보기</button></a></td>
									<td class="code-deny">반려</td>
								</tr>
								<tr>
									<th scope="row">4</th>
									<td>2023-10-13</td>
									<td>나길주</td>
									<td>kosa_oti_team_1</td>
									<td>notice_id</td>
									<td>시퀀스</td>
									<td><a href="${pageContext.request.contextPath}/sequence/sequenceApplyDetail"><button class="btn-history-details">상세보기</button></a></td>
									<td class="code-deny">반려</td>
								</tr>
								<tr>
									<th scope="row">5</th>
									<td>2023-10-13</td>
									<td>나길주</td>
									<td>kosa_oti_team_1</td>
									<td>notice_id</td>
									<td>시퀀스</td>
									<td><a href="${pageContext.request.contextPath}/sequence/sequenceApplyDetail"><button class="btn-history-details">상세보기</button></a></td>
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
<script src="${pageContext.request.contextPath}/resources/js/dbObject/sequence/sequenceApplyList.js"></script>
</body>
</html>