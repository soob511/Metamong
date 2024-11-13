<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="table-container">
	<table class="table table-hover">
		<thead class="table">
			<tr class="table-light">
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
		<tbody id="searchSequenceList">
		<c:if test="${pager.totalRows > 0}">
			<c:forEach items="${list}" var="seq" varStatus="status">
				<tr>
					<td scope="row">${status.index+1}</td>
					<td><fmt:formatDate value="${seq.applyDate}"
							pattern="yyyy-MM-dd" /></td>
					<td>${seq.MName}</td>
					<td>${seq.schemaName}</td>
					<td>${seq.seqName}</td>
					<td>${seq.applyType}</td>
					<td><a
						href="${pageContext.request.contextPath}/sequence/sequenceApplyDetail"><button
								class="btn-history-details">상세보기</button></a></td>
					<td class="code-approve"><c:choose>
							<c:when test="${seq.approvalStatus == 0}">
								<span id="status-await">승인대기</span>
							</c:when>
							<c:when test="${seq.approvalStatus == 1}">
								<span id="status-approve">승인</span>
							</c:when>
							<c:when test="${seq.approvalStatus == 2}">
								<span id="status-rejected">반려</span>
							</c:when>
							<c:when test="${seq.approvalStatus == 3}">
								<span id="status-applied">반영</span>
							</c:when>
						</c:choose></td>
				</tr>
			</c:forEach>
			</c:if>
			<c:if test="${pager.totalRows == 0}">
				<tr>
					<th colspan="8">검색 조건에 맞는 내역이 없습니다.</th>
				</tr>
			</c:if>
		</tbody>
	</table>
</div>
  	<c:if test="${pager.totalRows > 0}">
<div class="page">
	<a href="javascript:sequenceApplySearch(1)"
		class="btn btn-outline-secondary btn-sm"><<</a>
	<c:if test="${pager.groupNo > 1}">
		<a href="javascript:sequenceApplySearch(${pager.startPageNo - 1})"
			class="btn btn-outline-info btn-sm"><</a>
	</c:if>

	<c:forEach begin="${pager.startPageNo}" end="${pager.endPageNo}"
		step="1" var="i">
		<c:if test="${pager.pageNo == i}">
			<a href="javascript:sequenceApplySearch(${i})" class="btn btn-secondary btn-sm">${i}</a>
		</c:if>
		<c:if test="${pager.pageNo != i}">
			<a href="javascript:sequenceApplySearch(${i})"
				class="btn btn-outline-secondary btn-sm">${i}</a>
		</c:if>
	</c:forEach>

	<c:if test="${pager.groupNo < pager.totalGroupNo}">
		<a href="javascript:sequenceApplySearch(${pager.endPageNo + 1})"
			class="btn btn-outline-info btn-sm">></a>
	</c:if>
	<a href="javascript:sequenceApplySearch(${pager.totalPageNo})"
		class="btn btn-outline-secondary btn-sm">>></a>
</div>
</c:if>