<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>테이블/컬럼 신청 상세보기</title>
<link
	href="${pageContext.request.contextPath}/resources/css/dbObject/table/tableApplyDetail.css"
	rel="stylesheet" />
</head>
<body>
	<div class="container codeApplyInfo-container">
		<div class="row">
			<jsp:include page="/WEB-INF/views/common/menu.jsp" />

			<div class="col codeApplyInfo-main">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />

				<div class="codeApplyInfo-header">
					<p class="codeApplyInfo-title">&gt; 테이블/컬럼 신청 상세보기</p>
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
										<div class="table-text" id="table-content">코드 재작성 필요</div>
									</td>
								</tr>
							</table>
						</div>
						<div class="col code">
							<div class="codeAdd-subtitle">테이블</div>
							<table class="table table-bordered code-table">
								<tr>
									<td class="table-primary">스키마명</td>
									<td colspan="5">
										<div class="table-text">EMP</div>
									</td>
								</tr>
								<tr>
									<td class="table-primary">테이블(논리)</td>
									<td colspan="5">
										<div class="table-text">재산정보</div>
									</td>
								</tr>
								<tr>
									<td class="table-primary">테이블(물리)</td>
									<td colspan="5">
										<div class="table-text">PRPT_INFO</div>
									</td>
								</tr>
								<!-- 사용여부 추가 -->
								<tr>
									<td class="table-primary">신청사유</td>
									<td colspan="5">
										<div class="table-text" id="table-content">긴히 쓸일이 있어용</div>
									</td>
								</tr>
							</table>

						</div>
					</div>

				</div>
				<div class="button-group">
				<a href="tableCompare">
					<div class="btn-compare" type="button">전/후비교</div>
					</a>
				</div>


				<div class="item-container">
					<div class="item-header">컬럼</div>
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
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>001</th>
								<td>자동차</td>
								<td>CARNO</td>
								<td>VARCHAR2</td>
								<td>2</td>
								<td>NULL</td>
								<td>Y</td>	
							</tr>
							<tr>
									<th>002</th>
								<td>자동차</td>
								<td>CARNO</td>
								<td>VARCHAR2</td>
								<td>2</td>
								<td>NULL</td>
								<td>N</td>	
							</tr>
							<tr>
							<th>003</th>
								<td>자동차</td>
								<td>CARNO</td>
								<td>VARCHAR2</td>
								<td>2</td>
								<td>NULL</td>
								<td>N</td>	
							</tr>
						</tbody>
					</table>
				</div>

				<div class="button-group">
					<a href="tableApplyList">
						<div class="btn-list" type="button">목록</div>
					</a>
				</div>

				<script
					src="${pageContext.request.contextPath}/resources/js/dbObject/table/tableApplyList.js"></script>
</body>
</html>
