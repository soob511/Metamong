<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
					<div class="d-flex  justify-content-start">
					<div>총 <span class="form-required" id="memberCount">${totalRows}</span>개의 계정이 있습니다.</div>
					</div>
					<table class="table table-hover table-container" style="table-layout: fixed;">
						  <colgroup>
						    <col style="width: 50px;">
						    <col style="width: 170px;">
						    <col style="width: 75px;">
						    <col style="width: 140px;">
						    <col style="width: 140px;">
						    <col style="width: 250px;">
						    <col style="width: 250px;">
						    <col style="width: 115px;">
						    <col style="width: 95px;">
						  </colgroup>
						<thead class="table">
							<tr class="table-light">
								<th scope="col">No.</th>
								<th scope="col">ID</th>
								<th scope="col">이름</th>
								<th scope="col">권한</th>
								<th scope="col">소속</th>
								<th scope="col">사번</th>
								<th scope="col">연락처</th>
								<th scope="col">가입일</th>
								<th scope="col">사용여부</th>
								<th scope="col">정보수정</th>
							</tr>
						</thead>
						<tbody id="memberTable">
							<c:if test="${totalRows>=1}">
								<c:forEach items="${list}"  var="member"  varStatus="status" >
								<tr class="table-row">
								<form id="updateAccount-${member.MId}" action="updateAccount" method="post">
									<td scope="row">${pager.totalRows - (pager.pageNo-1) * 10 - status.index}</td>
									<td id="mId-${member.MId}" ><input type="hidden" name="mId" value="${member.MId}" />${member.MId}</td>
									<td id="mName-${member.MId}"><input type="hidden" name="mName" value="${member.MName}" />${member.MName}</td>
									<td>
										<div>
										<select id="mRole-${member.MId}" name="mRole" class="form-select"
											aria-label="Default select example">
											<option value="ROLE_USER" ${member.MRole == 'USER' ? 'selected' : ''}>USER</option>
											<option value="ROLE_DBA" ${member.MRole == 'DBA' ? 'selected' : ''}>DBA</option>
											<option value="ROLE_ADMIN" ${member.MRole == 'ADMIN' ? 'selected' : ''}>ADMIN</option>
										</select>
										</div>
									</td>
									<td>
											<div>
												  <select id="teamName-${member.MId}" class="form-select teamId" name="teamName"
												    data-team-name="${member.teamName}" aria-label="Team Selection" value="${member.teamName}">
												  </select>
												</div>
										</td>
										<td id="edit"><input type="text" class="form-control" id="mEmpId-${member.MId}" name="mEmpId" value="${member.MEmpId}"></td>
										<td id="edit"><input type="text" class="form-control" id="mTel-${member.MId}" name="mTel" value="${member.MTel}"></td>
										<td><fmt:formatDate value="${member.MRegdate}" pattern="yyyy-MM-dd"/></td>
										<td>
											<div>
												<select id="mIsactive-${member.MId}" class="form-select" name="mIsactive" aria-label="Default select example">
													<option value="1" ${member.MIsActive == 1 ? 'selected' : ''}>Y</option>
													<option value="0" ${member.MIsActive == 0 ? 'selected' : ''}>N</option>
												</select>
											</div>
										</td>
										<td><button class="btn btn-sm me-2 btn-approve" id="btn-approve" data-m-id="${member.MId}" type="button">수정</button></td>
										<input type="hidden" name="mId" value="${member.MId}">					
									</form>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${totalRows==0}" > 
				        	<tr>
				        		<th colspan="10">검색 결과가 없습니다.</th>
				        	</tr>
   						 </c:if> 
						</tbody>
					</table>
					
					<c:if test="${totalRows>0 }">
						<div class="page">
							<a href="javascript:accountSearch(1)"
								class="btn btn-outline-secondary btn-sm"><<</a>
							<c:if test="${pager.groupNo>1}">
								<a href="javascript:accountSearch(${pager.startPageNo-1})"
									class="btn btn-outline-dark btn-sm"><</a>
							</c:if>
						
							<c:forEach begin="${pager.startPageNo}" end="${pager.endPageNo}"
								step="1" var="i">
								<c:if test="${pager.pageNo==i}">
									<a href="javascript:accountSearch(${i})"
										class="btn btn-secondary btn-sm">${i}</a>
								</c:if>
								<c:if test="${pager.pageNo!=i}">
									<a href="javascript:accountSearch(${i})"
										class="btn btn-outline-secondary btn-sm">${i}</a>
								</c:if>
							</c:forEach>
						
							<c:if test="${pager.groupNo<pager.totalGroupNo}">
								<a href="javascript:accountSearch(${pager.endPageNo+1})"
									class="btn btn-outline-dark btn-sm">></a>
							</c:if>
							<a href="javascript:accountSearch(${pager.totalPageNo})"
								class="btn btn-outline-secondary btn-sm">>></a>
						</div>
 					</c:if>
<script src="${pageContext.request.contextPath}/resources/js/account/accountList.js"></script>