<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>인덱스 삭제 신청</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/dbObject/index/indexDeleteForm.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<jsp:include page="/WEB-INF/views/common/menu.jsp" />
			<div class="col">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />
				<div class="index-container">
					<div>
						<div class="index-list-header">
							<p>&gt; 인덱스 삭제</p>
						</div>
					</div>
					<hr>
					<div class="container index-tables">
						<div class="row">
							<div class="col-7 index-table">
								<p class="index-apply-title">인덱스</p>
								<div class="table-container">
									<table class="table table-hover">
										<thead class="table-light">
											<tr>
												<th scope="col">No.</th>
												<th scope="col">스키마명</th>
												<th scope="col">인덱스명</th>
												<th scope="col">참조테이블명</th>
												<th scope="col">참조컬럼명</th>
												<th scope="col">컬럼순서</th>
												<th scope="col">유일성</th>
												<th scope="col">정렬</th>
												<th scope="col">PK</th>
											</tr>
										</thead>
										<tbody id="indexTableBody">
											<c:forEach items="${list}" var="index" varStatus="status">
												<tr>
												<th style="display: none;">
													<input class="form-check-input" type="checkbox" checked>
												</th>
												<td>${status.index + 1}</td>
												<td data-name="schemaName" data-value="${index.schemaName}">
							                      	<c:choose>
									                    <c:when test="${index.schemaName == 'USER_2024_OTI_FINAL_TEAM1_1'}">SPM</c:when>
									                    <c:when test="${index.schemaName == 'USER_2024_OTI_FINAL_TEAM1_2'}">PMS</c:when>
									                    <c:when test="${index.schemaName == 'USER_2024_OTI_FINAL_TEAM1_3'}">HR</c:when>
									                    <c:otherwise></c:otherwise>
									                </c:choose>
							                	</td>
												<td data-name="idxName" data-value="${index.indexName}">
													${index.indexName}
												</td>
												<td data-name="tableName" data-value="${index.tableName}">
													${index.tableName}
												</td>
												<td data-name="refColumn" data-value="${index.columnName}">
													${index.columnName}
												</td>
												<td data-name="columnPosition" data-value="${index.columnPosition}">
													${index.columnPosition}
												</td>
												<td data-name="isUnique" data-value="${index.uniqueness}">
													${index.uniqueness}
												</td>
												<td data-name="descend" data-value="${index.descend}">
													${index.descend}
												</td>
												<td data-name="pkStatus" data-value="${index.pkStatus}">
													${index.pkStatus}
												</td>
												<td data-name="tableNo" data-value="${index.tableNo}" style="display: none;"></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<div class="col index-apply-reason">
								<p>신청사유</p>
								<textarea id="indexApplyReason">${applyReason}</textarea>
								<div class="msg" id="reasonValidMessage"></div>
								<button id="btnApply" class="btn-add">신청</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/resources/js/dbObject/index/indexDeleteForm.js"></script>
</body>
</html>