<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<div class="table-container">
	<table class="table table-hover">
		<thead class="table">
			<tr class="table-light">
				<th scope="col">No.</th>
				<th scope="col">신청일자</th>
				<th scope="col">신청자</th>
				<th scope="col">스키마명</th>
				<th scope="col">인덱스명</th>
				<th scope="col">분류</th>
				<th scope="col">상세보기</th>
				<th scope="col">상태</th>
			</tr>
		</thead>
		<tbody id="indexApplyTable">
			<c:forEach items="${list}" var="index" varStatus="status">
				<tr>
					<th>${pager.totalRows - (pager.pageNo - 1) * pager.rowsPerPage - status.index}</th>
					<td><fmt:formatDate value="${index.applyDate}"
							pattern="yyyy-MM-dd" /></td>
					<td>${index.MName}</td>
					<td>${index.schemaName}</td>
					<td>${index.idxName}</td>
					<td>${index.applyType}</td>
					<td><a
						href="indexApplyDetail?applyNo=${index.applyNo}&indexNo=${pager.totalRows - (pager.pageNo - 1) * pager.rowsPerPage - status.index}&applyType=${index.applyType}"><button
								class="btn-history-details">상세보기</button></a></td>
					<td><c:choose>
							<c:when test="${index.approvalStatus == 0}">
								<span id="status-await">승인대기</span>
							</c:when>
							<c:when test="${index.approvalStatus == 1}">
								<span id="status-approve">승인</span>
							</c:when>
							<c:when test="${index.approvalStatus == 2}">
								<span id="status-rejected">반려</span>
							</c:when>
							<c:when test="${index.approvalStatus == 3}">
								<span id="status-applied">반영</span>
							</c:when>
						</c:choose></td>
				</tr>
			</c:forEach>
			<c:if test="${pager.totalRows == 0}">
             	<tr>
             		<th colspan="8">검색 조건에 맞는 내역이 없습니다.</th>
             	</tr>
             </c:if>
		</tbody>
	</table>
</div>
<div class="page">
	<a href="javascript:filterApplyIndexPaging(1)" class="btn btn-outline-secondary btn-sm"><<</a>
	<c:if test="${pager.groupNo > 1}">
		<a href="javascript:filterApplyIndexPaging(${pager.startPageNo - 1})}"
			class="btn btn-outline-dark btn-sm"><</a>
	</c:if>
	<c:if test="${pager.totalRows != 0}">
	<c:forEach begin="${pager.startPageNo}" end="${pager.endPageNo}"
		step="1" var="i">
		<c:if test="${pager.pageNo == i}">
			<a href="javascript:filterApplyIndexPaging(${i})"
				class="btn btn-secondary btn-sm">${i}</a>
		</c:if>
		<c:if test="${pager.pageNo != i}">
			<a href="javascript:filterApplyIndexPaging(${i})"
				class="btn btn-outline-secondary btn-sm">${i}</a>
		</c:if>
	</c:forEach>
	</c:if>
	<c:if test="${pager.groupNo < pager.totalGroupNo}">
		<a href="javascript:filterApplyIndexPaging(${pager.endPageNo + 1})}"
			class="btn btn-outline-dark btn-sm">></a>
	</c:if>
	<a href="javascript:filterApplyIndexPaging(${pager.totalPageNo})"
		class="btn btn-outline-secondary btn-sm">>></a>
</div>
