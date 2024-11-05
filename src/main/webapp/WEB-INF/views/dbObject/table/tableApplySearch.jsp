<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="table-container">
	<table class="table table-hover">
		<thead class="table-secondary">
			<tr>
				<th scope="col">No.</th>
				<th scope="col">신청일자</th>
				<th scope="col">신청자</th>
				<th scope="col">스키마명</th>
				<th scope="col">테이블명</th>
				<th scope="col">분류</th>
				<th scope="col">상세보기</th>
				<th scope="col">상태</th>
			</tr>
		</thead>
		<tbody id="applyTableList">
			<c:forEach items="${list}" var="tableList" varStatus="status">
				<tr>
					<th scope="row">${status.index+1}</th>
					<td><fmt:formatDate value="${tableList.applyDate}"
							pattern="yyyy-MM-dd" /></td>
					<td>${tableList.MName}</td>
					<td>${tableList.schemaName}</td>
					<td>${tableList.tableId}</td>
					<td>${tableList.applyObj}</td>
					<td><button class="btn-history-details"
							onclick="tableListDetail(${tableList.applyNo},${status.index+1})">상세보기</button></td>
					<td class="code-approve"><c:choose>
							<c:when test="${tableList.approvalStatus == 0}">
								<span id="status-await">승인대기</span>
							</c:when>
							<c:when test="${tableList.approvalStatus == 1}">
								<span id="status-approve">승인</span>
							</c:when>
							<c:when test="${tableList.approvalStatus == 2}">
								<span id="status-rejected">반려</span>
							</c:when>
							<c:when test="${tableList.approvalStatus == 3}">
								<span id="status-applied">반영</span>
							</c:when>
						</c:choose></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="page">
	<a href="tableApplyList?pageNo=1"
		class="btn btn-outline-primary btn-sm"><<</a>
	<c:if test="${pager.groupNo>1}">
		<a href="tableApplyList?pageNo=${pager.startPageNo-1}"
			class="btn btn-outline-info btn-sm"><</a>
	</c:if>

	<c:forEach begin="${pager.startPageNo}" end="${pager.endPageNo}"
		step="1" var="i">
		<c:if test="${pager.pageNo==i}">
			<a href="tableApplyList?pageNo=${i}" class="btn btn-primary btn-sm">${i}</a>
		</c:if>
		<c:if test="${pager.pageNo!=i}">
			<a href="tableApplyList?pageNo=${i}"
				class="btn btn-outline-primary btn-sm">${i}</a>
		</c:if>
	</c:forEach>

	<c:if test="${pager.groupNo<pager.totalGroupNo}">
		<a href="tableApplyList?pageNo=${pager.endPageNo+1}"
			class="btn btn-outline-info btn-sm">></a>
	</c:if>
	<a href="tableApplyList?pageNo=${pager.totalPageNo}"
		class="btn btn-outline-primary btn-sm">>></a>
</div>

