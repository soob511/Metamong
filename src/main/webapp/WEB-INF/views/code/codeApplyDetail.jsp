<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>코드/항목 신청 상세보기</title>
<link
	href="${pageContext.request.contextPath}/resources/css/code/codeApplyDetail.css"
	rel="stylesheet" />
</head>
<body>
	<div class="container codeApplyInfo-container">
		<div class="row">
			<jsp:include page="/WEB-INF/views/common/menu.jsp" />

			<div class="col codeApplyInfo-main">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />

				<div class="codeApplyInfo-header">
					<p class="codeApplyInfo-title">&gt; 코드/항목 신청 상세보기</p>
					<!-- <div class="button-groupDBA">
						<button class="btn-approve">승인</button>
						<button class="btn-reject">반려</button>
					</div> -->
				</div>

				<hr>
				<div class="container">
					<div class="row">
						<div class="col codeApplyInfo">
							<div class="codeApplyInfo-subtitle">신청정보</div>
							<table class="table table-bordered codeApplyInfo-table">
								<tr>
									<td class="table-primary">No.</td>
									<td colspan="5">
										<div class="table-text">12345</div>
									</td>
								</tr>
								<tr>
									<td class="table-primary">신청일자</td>
									<td colspan="3">
										<div class="table-text">2024-10-22</div>
									</td>
									<td class="table-primary">신청자</td>
									<td>
										<div class="table-text">홍길동</div>
									</td>
								</tr>
								<tr>
									<td class="table-primary">처리일자</td>
									<td colspan="3">
										<div class="table-text">2024-10-25</div>
									</td>
									<td class="table-primary">처리자</td>
									<td>
										<div class="table-text">김철수</div>
									</td>
								</tr>
								<tr>
									<td class="table-primary">승인여부</td>
									<td colspan="5">
										<div class="table-text">Y</div>
									</td>
								</tr>
								<tr>
									<td class="table-primary">사유</td>
									<td colspan="5">
										<div class="table-text">코드 재작성 필요</div>
									</td>
								</tr>
							</table>




						</div>

						<div class="col code">
							<div class="codeAdd-subtitle">코드</div>
							<table class="table table-bordered code-table">
								<tr>
									<td class="table-primary">코드명(논리)</td>
									<td colspan="5">
										<div class="table-text">재산정보 (논리)</div>
									</td>
								</tr>
								<tr>
									<td class="table-primary">코드명(물리)</td>
									<td colspan="5">
										<div class="table-text">PRPT (물리)</div>
									</td>
								</tr>
								<tr>
									<td class="table-primary">내용</td>
									<td colspan="5">
										<div class="table-text">재산에 관한 코드입니다.</div>
									</td>
								</tr>
								<!-- 사용여부 추가 -->
								<tr>
									<td class="table-primary">사용여부</td>
									<td colspan="5">
										<div class="table-text">Y</div>
									</td>
								</tr>
							</table>

						</div>
					</div>

				</div>
				<div class="button-group">
					<a href="codeCompare">
						<div class="btn-compare" type="button">전/후비교</div>
					</a>
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
						<div class="btn-list" type="button">목록</div>
					</a>
				</div>

				<script
					src="${pageContext.request.contextPath}/resources/js/code/codeApplyList.js"></script>
</body>
</html>
