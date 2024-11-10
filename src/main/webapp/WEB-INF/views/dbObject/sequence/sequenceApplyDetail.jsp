<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>시퀀스 상세보기</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/dbObject/sequence/sequenceDetail.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/dbObject/common/sqlModal.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<jsp:include page="/WEB-INF/views/common/menu.jsp" />
			<div class="col">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />
				<div class="index-container" id="applyContainer" data-applyno="${detail.applyNo}" data-indexno="${detail.indexNo}">
					<div class="table-list-header">
						<p class="table-list-title">&gt; DB Object &gt; 신청내역 &gt; 시퀀스
							상세보기</p>
						<sec:authorize access="hasRole('ROLE_DBA')">
							<div class="button-groupDBA">
								<c:choose>
									<c:when test="${detail.approvalStatus == 0}">
										<button class="btn-approve" onclick="sequenceProcessApproval(1)">승인</button>
										<button class="btn-reject" onclick="sequenceProcessApproval(2)">반려</button>
									</c:when>
									<c:when test="${detail.approvalStatus == 1}">
										<button class="btn-reflect">반영</button>
									</c:when>
									<c:when
										test="${detail.approvalStatus == 2 || detail.approvalStatus == 3}">
										<button class="btn-complete">처리완료</button>
									</c:when>
								</c:choose>
							</div>
						</sec:authorize>
					</div>
					<hr>
					<table class="table table-bordered">
						<tr>
							<td class="table-secondary">No.</td>
							<td id="table-contents" colspan="3">${detail.indexNo}</td>
						</tr>
						<tr>
							<td class="table-secondary">신청일자</td>
							<td id="table-contents" style="width: 38%"><fmt:formatDate
									value="${detail.applyDate}" pattern="yyyy-MM-dd" /></td>
							<td class="table-secondary">신청자</td>
							<td id="table-contents" style="width: 38%">${detail.MName}</td>
						</tr>
						<tr>
							<td class="table-secondary">처리일자</td>
							<td id="table-contents" style="width: 38%"><fmt:formatDate
									value="${detail.complDate}" pattern="yyyy-MM-dd" /></td>
							<td class="table-secondary">처리자</td>
							<td id="table-contents" style="width: 38%">${detail.dbaName}</td>
						</tr>
						<tr>
							<td class="table-secondary">시퀀스명</td>
							<td id="table-contents" colspan="3">${detail.seqName}</td>

						</tr>
						<tr>
							<td class="table-secondary">스키마명</td>
							<td id="table-contents" colspan="3">${detail.schemaName}</td>

						</tr>
						<tr>
							<td class="table-secondary">신청사유</td>
							<td id="table-contents" colspan="3">${detail.applyReason}</td>

						</tr>
						<tr>
							<td class="table-secondary">상태</td>
							<td id="table-contents" colspan="3"><c:choose>
									<c:when test="${detail.approvalStatus == 0}">
										<span id="status-await">승인대기</span>
									</c:when>
									<c:when test="${detail.approvalStatus == 1}">
										<span id="status-approve">승인</span>
									</c:when>
									<c:when test="${detail.approvalStatus == 2}">
										<span id="status-rejected">반려</span>
									</c:when>
									<c:when test="${detail.approvalStatus == 3}">
										<span id="status-applied">반영</span>
									</c:when>
								</c:choose></td>
						</tr>
						<tr>
							<td class="table-secondary">반려사유</td>
							<td id="table-contents" colspan="3">${detail.rejectReason}</td>
						</tr>
						<tr>
							<td class="table-secondary">쿼리문</td>
							<td id="table-contents" colspan="3">
								<button class="btn-sql" data-bs-toggle="modal"
									data-bs-target="#sqlLoadModal">SQL</button>
							</td>
						</tr>
						<tr>
							<td class="table-secondary">첨부파일</td>
							<td id="table-contents" colspan="3"><a
								href="${pageContext.request.contextPath}/sequence/downloadFile?applyNo=${detail.applyNo}">
									${detail.seqFileName} </a></td>
						</tr>
					</table>
					<div class="button-group">
						<a
							href="${pageContext.request.contextPath}/sequence/sequenceApplyList"><button
								class="btn-list">목록</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="sqlLoadModal" tabindex="-1"
		aria-labelledby="sqlLoadModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="table-container">
						<div class="table-header d-flex align-items-center">SQL</div>
						<div class="table-body">${detail.query}</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/resources/js/dbObject/sequence/sequenceDetail.js"></script>
</body>
</html>