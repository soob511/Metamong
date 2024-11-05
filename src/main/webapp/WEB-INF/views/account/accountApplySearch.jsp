<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="d-flex  justify-content-start">
	<div>
		총 <span class="form-required" id="memberCount">${totalRows}</span>건의
		신청이 있습니다.
	</div>
</div>

<table class="table table-hover">
	<thead class="table-secondary">
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
					<td scope="row">${pager.totalRows - (pager.pageNo-1) * 10 - status.index}
					</td>
					<td><fmt:formatDate value="${member.MApplydate}"
							pattern="yyyy-MM-dd" /></td>
					<td>${member.MId}</td>
					<td>${member.MName}</td>
					<td>${member.MRole}</td>
					<td>${member.teamName}</td>
					<td>${member.MEmpId}</td>
					<td>${member.MTel}</td>
					<td>
						<button type="button" class="btn btn-sm me-2"
							style="background-color: #003567; color: white;">승인</button>
						<button type="button" class="btn btn-sm me-2"
							style="background-color: #949494; color: white;">반려</button>
					</td>
				</tr>
			</c:forEach>
		</c:if>
			<c:if test="${totalRows==0}" > 
	        	<tr>
	        		<th colspan="9">검색 결과가 없습니다.</th>
	        	</tr>
	    </c:if> 
	</tbody>
</table>

<c:if test="${totalRows>0 }">
<div class="page">
	<a href="javascript:memberSearch(1)"
		class="btn btn-outline-secondary btn-sm"><<</a>
	<c:if test="${pager.groupNo>1}">
		<a href="javascript:memberSearch(${pager.startPageNo-1})"
			class="btn btn-outline-dark btn-sm"><</a>
	</c:if>

	<c:forEach begin="${pager.startPageNo}" end="${pager.endPageNo}"
		step="1" var="i">
		<c:if test="${pager.pageNo==i}">
			<a href="javascript:memberSearch(${i})"
				class="btn btn-secondary btn-sm">${i}</a>
		</c:if>
		<c:if test="${pager.pageNo!=i}">
			<a href="javascript:memberSearch(${i})"
				class="btn btn-outline-secondary btn-sm">${i}</a>
		</c:if>
	</c:forEach>

	<c:if test="${pager.groupNo<pager.totalGroupNo}">
		<a href="javascript:memberSearch(${pager.endPageNo+1})"
			class="btn btn-outline-dark btn-sm">></a>
	</c:if>
	<a href="javascript:memberSearch(${pager.totalPageNo})"
		class="btn btn-outline-secondary btn-sm">>></a>

</div>
 </c:if>
<script src="${pageContext.request.contextPath}/resources/js/account/accountApplyList.js"></script>
