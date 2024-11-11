<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>테이블/컬럼 신청 상세보기</title>
<link
	href="${pageContext.request.contextPath}/resources/css/dbObject/table/tableApplyDetail.css"
	rel="stylesheet" />
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>
<body>
	<div class="container codeApplyInfo-container">
		<div class="row">
			<jsp:include page="/WEB-INF/views/common/menu.jsp" />

			<div class="col codeApplyInfo-main">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />

				<div class="codeApplyInfo-header">
					<p class="codeApplyInfo-title">&gt; 테이블/컬럼 신청 상세보기</p>
					<sec:authorize access="hasRole('ROLE_DBA')">
						<div class="button-groupDBA">
							<c:choose>
								<c:when test="${applyList.approvalStatus == 0}">
									<button class="btn-approve" onclick="tableApplyProcess(1)">승인</button>
									<button class="btn-reject" onclick="tableApplyProcess(2)">반려</button>
								</c:when>
								<c:when test="${applyList.approvalStatus == 1}">
									<button class="btn-reflect">반영</button>
								</c:when>
								<c:when
									test="${applyList.approvalStatus == 2 || applyList.approvalStatus == 3}">
									<button class="btn-complete">처리완료</button>
								</c:when>
							</c:choose>
						</div>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_USER')">
						<div class="button-groupUSER">
							<c:choose>
								<c:when test="${applyList.approvalStatus == 2}">
									<button class="btn-reapply">재작성</button>
								</c:when>
							</c:choose>
						</div>
					</sec:authorize>
				</div>
				<hr>
				<div id="applyContainer" class="container"
					data-applyno="${applyList.applyNo}">
					<div class="row">
						<div class="col codeApplyInfo">
							<div class="codeApplyInfo-subtitle">신청정보</div>
							<table class="table table-bordered codeApplyInfo-table">
								<tr data-indexno="${indexNo}">
									<td class="table-secondary">No.</td>
									<td colspan="5">
										<div class="table-text">${indexNo}</div>
									</td>
								</tr>
								<tr>
									<td class="table-secondary">신청일자</td>
									<td colspan="3">
										<div class="table-text">
											<fmt:formatDate value="${applyList.applyDate}"
												pattern="yyyy-MM-dd" />
										</div>
									</td>

									<td class="table-secondary">신청자</td>
									<td>
										<div class="table-text">${applyList.MName}</div>
									</td>
								</tr>
								<tr>
									<td class="table-secondary">처리일자</td>
									<td colspan="3"><fmt:formatDate
											value="${applyList.complDate}" pattern="yyyy-MM-dd" /></td>

									<td class="table-secondary">처리자</td>
									<td>
										<div class="table-text">${applyList.dbaName}</div>
									</td>
								</tr>
								<tr>
									<td class="table-secondary">승인상태</td>
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
									<td class="table-secondary">반려사유</td>
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
									<td class="table-secondary">스키마명</td>
									<td colspan="5">
										<div class="table-text">${applyList.schemaName}</div>
									</td>
								</tr>
								<tr>
									<td class="table-secondary">테이블(논리)</td>
									<td colspan="5">
										<div class="table-text">${applyTable.tableNm}</div>
									</td>
								</tr>
								<tr>
									<td class="table-secondary">테이블(물리)</td>
									<td colspan="5">
										<div class="table-text">${applyTable.tableId}</div>
									</td>
								</tr>
								<tr>
									<td class="table-secondary">내용</td>
									<td colspan="5">
										<div class="table-text" id="table-content">${applyTable.tableContent}</div>
									</td>
								</tr>
								<tr>
									<td class="table-secondary">신청사유</td>
									<td colspan="5">
										<div class="table-text" id="table-content">${applyList.applyReason}</div>
									</td>
								</tr>
							</table>

						</div>
					</div>

				</div>


				<div class="item-container">
					<div class="item-header">컬럼</div>
					<div id="item-background">
					<table class="table table-hover  bottom-table">
						<thead class="table-secondary">
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
		src="${pageContext.request.contextPath}/resources/js/dbObject/table/tableApplyDetail.js"></script>
</body>

</html>
