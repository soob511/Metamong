<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<div class="d-flex justify-content-start">
	<div>
		총 <span class="form-required" id="memberCount">${totalRows}</span>건의 신청이 있습니다.
	</div>
</div>
<table class="table table-hover table-container" style="table-layout: fixed;">
  <colgroup>
    <col style="width: 70px;">
    <col style="width: 170px;">
    <col style="width: 220px;">
    <col style="width: 120px;">
    <col style="width: 120px;">
    <col style="width: 120px;">
    <col style="width: 150px;">
    <col style="width: 210px;">
  </colgroup>
	<thead class="table-light">
		<tr>
			<th scope="col">No.</th>
			<th scope="col">신청일</th>
			<th scope="col">ID</th>
			<th scope="col">이름</th>
			<th scope="col">권한</th>
			<th scope="col">소속</th>
			<th scope="col">사번</th>
			<th scope="col">연락처</th>
			<th scope="col">승인/반려</th>
		</tr>
	</thead>
	<tbody id="memberTable">
		<c:if test="${totalRows>=1}">
			<c:forEach items="${list}" var="member" varStatus="status">
				<tr class="table-row">
					<td scope="row">${pager.totalRows - (pager.pageNo-1) * 10 - status.index}</td>
					<td><fmt:formatDate value="${member.MApplydate}" pattern="yyyy-MM-dd" /></td>
					<td>${member.MId}</td>
					<td>${member.MName}</td>
					<td>${member.MRole}</td>
					<td>${member.teamName}</td>
					<td>${member.MEmpId}</td>
					<td>${member.MTel}</td>
					<td class="apply-approve">
						<c:choose>
							<c:when test="${member.MApprovalStatus == 0}">
								<button class="btn btn-sm me-2" id="btn-approve" onclick="accountApplyProcess('${member.MId}', 1)">승인</button>
								<button class="btn btn-sm me-2" id="btn-reject" onclick="accountApplyProcess('${member.MId}', 2)">반려</button>
							</c:when>
							<c:when test="${member.MApprovalStatus == 1}">
								<span id="status-approve">승인</span>
							</c:when>
							<c:when test="${member.MApprovalStatus == 2}">
								<span id="status-rejected">반려</span>
							</c:when>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${totalRows==0}">
			<tr>
				<th colspan="9">검색 결과가 없습니다.</th>
			</tr>
		</c:if>
	</tbody>
</table>
<c:if test="${totalRows>0}">
	<div class="page">
		<a href="javascript:accountApplySearch(1)" class="btn btn-outline-secondary btn-sm"><<</a>
		<c:if test="${pager.groupNo>1}">
			<a href="javascript:accountApplySearch(${pager.startPageNo-1})" class="btn btn-outline-dark btn-sm"><</a>
		</c:if>
		<c:forEach begin="${pager.startPageNo}" end="${pager.endPageNo}" step="1" var="i">
			<c:if test="${pager.pageNo==i}">
				<a href="javascript:accountApplySearch(${i})" class="btn btn-secondary btn-sm">${i}</a>
			</c:if>
			<c:if test="${pager.pageNo!=i}">
				<a href="javascript:accountApplySearch(${i})" class="btn btn-outline-secondary btn-sm">${i}</a>
			</c:if>
		</c:forEach>
		<c:if test="${pager.groupNo<pager.totalGroupNo}">
			<a href="javascript:accountApplySearch(${pager.endPageNo+1})" class="btn btn-outline-dark btn-sm">></a>
		</c:if>
		<a href="javascript:accountApplySearch(${pager.totalPageNo})" class="btn btn-outline-secondary btn-sm">>></a>
	</div>
</c:if>
<script src="${pageContext.request.contextPath}/resources/js/account/accountApplyList.js"></script>