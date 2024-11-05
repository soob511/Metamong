<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="d-flex justify-content-between align-items-center">
	<div class="pt-3">
		총 <span class="form-required" id="noticeCount">${totalRows}</span>건의
		게시물이 있습니다.
	</div>
	<div class="d-flex">
		<div class="table-list-filters">
			<div class="schema-filter">
				<select id="schemaSelect" class="form-select"
					aria-label="Default select example">
					<option value="제목" ${option == '제목' ? 'selected' : ''}>제목</option>
					<option value="내용" ${option == '내용' ? 'selected' : ''}>내용</option>
				</select>
			</div>
		</div>
		<div class="table-search">
			<div class="container-fluid">
				<div class="d-flex search-form">
					<input class="form-control" type="search" id="noticeSearch"
						name="keyword" placeholder="Search" aria-label="Search"> <i
						class="bi bi-search"></i>
				</div>
			</div>
		</div>
	</div>
</div>
<table class="table table-hover">
	<thead>
		<tr class="table-secondary">
			<th scope="col">No.</th>
			<th scope="col">제목</th>
			<th scope="col">등록일</th>
			<th scope="col">조회수</th>
		</tr>
	</thead>
	<tbody id="noticeTable">
		<c:if test="${totalRows>=1}">
			<c:forEach items="${list}" var="notice" varStatus="status">
				<tr class="table-row">
					<td scope="row"><c:choose>
							<c:when test="${notice.noticeIsimp == '1'}">
								<img
									src="${pageContext.request.contextPath}/resources/image/icon_notice.png"
									alt="중요도" style="width: 33px; height: 33px">
							</c:when>
							<c:otherwise>
							${pager.totalRows - (pager.pageNo-1) * 10 - status.index}
						</c:otherwise>
						</c:choose></td>
					<td><a href="noticeDetail?noticeId=${notice.noticeId}"
						style="color: black;">${notice.noticeTitle}</a></td>
					<td><fmt:formatDate value="${notice.noticeRegdate}"
							pattern="yyyy-MM-dd" /></td>
					<td>${notice.noticeHitcount}</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${totalRows==0}">
			<tr>
				<th colspan="4">검색 결과가 없습니다.</th>
			</tr>
		</c:if>
	</tbody>
</table>

<c:if test="${totalRows>0 }">
	<div class="page" id="pagination">
		<a href="javascript:noticeSearch(1)"
			class="btn btn-outline-secondary btn-sm"><<</a>
		<c:if test="${pager.groupNo>1}">
			<a href="javascript:noticeSearch(${pager.startPageNo-1})"
				class="btn btn-outline-dark btn-sm"><</a>
		</c:if>

		<c:forEach begin="${pager.startPageNo}" end="${pager.endPageNo}"
			step="1" var="i">
			<c:if test="${pager.pageNo==i}">
				<a href="javascript:noticeSearch(${i})"
					class="btn btn-secondary btn-sm">${i}</a>
			</c:if>
			<c:if test="${pager.pageNo!=i}">
				<a href="javascript:noticeSearch(${i})"
					class="btn btn-outline-secondary btn-sm">${i}</a>
			</c:if>
		</c:forEach>

		<c:if test="${pager.groupNo<pager.totalGroupNo}">
			<a href="javascript:noticeSearch(${pager.endPageNo+1})"
				class="btn btn-outline-dark btn-sm">></a>
		</c:if>
		<a href="javascript:noticeSearch(${pager.totalPageNo})"
			class="btn btn-outline-secondary btn-sm">>></a>

	</div>
</c:if>
<script src="${pageContext.request.contextPath}/resources/js/notice/noticeList.js"></script>