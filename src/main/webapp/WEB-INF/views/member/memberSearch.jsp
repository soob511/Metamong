<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div class="d-flex justify-content-between align-items-center">
			<div class="pt-3">총 <span class="form-required" id="memberCount">${totalRows}</span>명의 회원이 있습니다.</div>
				<div class="d-flex">
                      <div class="table-list-filters">
                          <div class="schema-filter">
					<select id="schemaSelect" class="form-select"
						aria-label="Default select example">
						<option value="ID" ${option == 'ID' ? 'selected' : ''}>ID</option>
						<option value="이름" ${option == '이름' ? 'selected' : ''}>이름</option>
						<option value="권한" ${option == '권한' ? 'selected' : ''}>권한</option>
						<option value="소속" ${option == '소속' ? 'selected' : ''}>소속</option>
						<option value="사번" ${option == '사번' ? 'selected' : ''}>사번</option>
					</select>
				</div>
				</div>
				<div class="search-box">
						<input class="form-control" type="search"
							id="memberSearch" name="keyword" placeholder="Search" aria-label="Search">
						<i class="bi bi-search"></i>
				</div>
			</div>
			</div>
			<div class="table-container">
				<table class="table table-hover">
					<thead class="table-secondary">
						<tr>
							<th scope="col">No.</th>
							<th scope="col">ID</th>
							<th scope="col">이름</th>
							<th scope="col">권한</th>
							<th scope="col">소속</th>
							<th scope="col">사번</th>
							<th scope="col">연락처</th>
						</tr>
					</thead>
					<tbody id="memberTable">
						<c:if test="${totalRows>=1}">
						<c:forEach items="${list}" var="member" varStatus="status">
								<tr>
									<td scope="row">${status.index + 1 + (pager.pageNo - 1) * 10}</td>
									<td>${member.MId}</td>
									<td>${member.MName}</td>
									<td>${member.MRole}</td>
									<td>${member.teamName}</td>
									<td>${member.MEmpId}</td>
									<td>${member.MTel}</td>
						</tr>
							 </c:forEach>
						 </c:if>
				       <c:if test="${totalRows==0}" > 
				        	<tr>
				        		<th colspan="7">검색 결과가 없습니다.</th>
				        	</tr>
				    </c:if> 
					</tbody>
				</table>
			</div>
			
			<c:if test="${totalRows>0 }">
			<div class="page">
          			<a href="javascript:memberSearch(1)" class="btn btn-outline-secondary btn-sm"><<</a>
          			<c:if test="${pager.groupNo>1}">
          				<a href="javascript:memberSearch(${pager.startPageNo-1})" class="btn btn-outline-dark btn-sm"><</a>
          			</c:if>
          			
          			<c:forEach begin="${pager.startPageNo}" end="${pager.endPageNo}" step="1" var="i">
          				<c:if test="${pager.pageNo==i}">
          					<a href="javascript:memberSearch(${i})" class="btn btn-secondary btn-sm">${i}</a>
          				</c:if>
          				<c:if test="${pager.pageNo!=i}">
          					<a href="javascript:memberSearch(${i})" class="btn btn-outline-secondary btn-sm">${i}</a>
          				</c:if>
          			</c:forEach>
          			
          			<c:if test="${pager.groupNo<pager.totalGroupNo}">
          				<a href="javascript:memberSearch(${pager.endPageNo+1})" class="btn btn-outline-dark btn-sm">></a>
          			</c:if>
          			<a href="javascript:memberSearch(${pager.totalPageNo})" class="btn btn-outline-secondary btn-sm">>></a>
          			
          		</div>
          		 </c:if> 
          		<script src="${pageContext.request.contextPath}/resources/js/member/memberList.js"></script>