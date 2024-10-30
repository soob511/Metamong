
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
										<div class="table-text">${indexNo}</div>
									</td>
								</tr>
								<tr>
									<td class="table-primary">신청일자</td>
									<td colspan="3">
										<div class="table-text">
											<fmt:formatDate value="${applyList.applyDate}"
												pattern="yyyy-MM-dd" />
										</div>
									</td>

									<td class="table-primary">신청자</td>
									<td>
										<div class="table-text">${applyList.MName}</div>
									</td>
								</tr>
								<tr>
									<td class="table-primary">처리일자</td>
									<td colspan="3"><fmt:formatDate
											value="${applyList.complDate}" pattern="yyyy-MM-dd" /></td>

									<td class="table-primary">처리자</td>
									<td>
										<div class="table-text">${applyList.dbaName}</div>
									</td>
								</tr>
								<tr>
									<td class="table-primary">승인상태</td>
									<td colspan="5">
										<div class="table-text">
											<c:choose>
												<c:when test="${applyList.approvalStatus == 0}">승인대기</c:when>
												<c:when test="${applyList.approvalStatus == 1}">승인</c:when>
												<c:when test="${applyList.approvalStatus == 2}">반려</c:when>
												<c:when test="${applyList.approvalStatus == 3}">반영</c:when>
											</c:choose>
										</div>
									</td>

								</tr>
								<tr>
									<td class="table-primary">반려사유</td>
									<td colspan="5">
										<div class="table-text" id="table-content">${applyList.rejectReason}</div>
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
										<div class="table-text">${applyList.schemaName}</div>
									</td>
								</tr>
								<tr>
									<td class="table-primary">테이블(논리)</td>
									<td colspan="5">
										<div class="table-text">${applyTable.tableNm}</div>
									</td>
								</tr>
								<tr>
									<td class="table-primary">테이블(물리)</td>
									<td colspan="5">
										<div class="table-text">${applyTable.tableId}</div>
									</td>
								</tr>
								<!-- 사용여부 추가 -->
								<tr>
									<td class="table-primary">신청사유</td>
									<td colspan="5">
										<div class="table-text" id="table-content">${applyList.applyReason}</div>
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
							<c:forEach items="${applyColumn}" var="applyColumn"
								varStatus="status">
								<tr>
									<th>${status.index+1}</th>
									<td>${applyColumn.colNm}</td>
									<td>${applyColumn.colId}</td>
									<td>${applyColumn.dataType}</td>
									<td>${applyColumn.colLength}</td>
									<td><c:choose>
											<c:when test="${applyColumn.colIsnullable == 1}">NULL</c:when>
											<c:otherwise>NOT NULL</c:otherwise>
										</c:choose></td>

									<td><c:choose>
											<c:when test="${applyColumn.colIspk == 1}">Y</c:when>
											<c:otherwise>N</c:otherwise>
										</c:choose></td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<div class="button-group">
					<a href="tableApplyList">
						<div class="btn-list" type="button">목록</div>
					</a>
				</div>
			</div>
		</div>
	</div>

	<script
		src="${pageContext.request.contextPath}/resources/js/dbObject/table/tableApplyList.js"></script>
</body>

</html>
