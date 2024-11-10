<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> >계정관리 > 계정내역</title>
<link href="${pageContext.request.contextPath}/resources/css/account/accountApplyList.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row">
		<jsp:include page="/WEB-INF/views/common/menuAdmin.jsp" /> 
		<div class="col">
			<jsp:include page="/WEB-INF/views/common/header.jsp" />
				<div class="content">
					<h4 class="fw-bold">> 계정관리> 계정내역</h4>
					<div class="d-flex justify-content-end">
						<div class="d-flex align-items-center">
							<button data-bs-toggle="modal" data-bs-target="#teamModal" class="btn-team">소속 관리</button>
							<select id="searchSelect" class="form-select"
								aria-label="Default select example">
								<option value="All" data-status="">전체</option>
								<option>ID</option>
								<option>이름</option>
								<option>권한</option>
								<option>소속</option>
								<option>사번</option>
							</select>
							</div>
						
						<div class="search-box">
								<input class="form-control me-2" type="search"
									id="memberSearch" placeholder="Search" aria-label="Search">
								<i class="bi bi-search"></i>
						</div>
						</div>
			
					<div id="memberList">
					<div class="d-flex  justify-content-start">
					<div class="pb-3">총 <span class="form-required" id="memberCount">${totalRows}</span>개의 계정이 있습니다.</div>
					</div>
					<table class="table table-hover">
						<thead class="table">
							<tr class="table-secondary">
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
							<c:forEach items="${list}"  var="member"  varStatus="status" >
							<tr class="table-row">
								<form id="updateAccount-${member.MId} " action="updateAccount" method="post">
									<td scope="row">${pager.totalRows - (pager.pageNo-1) * 10 - status.index}</td>
									<td id="mId-${member.MId}">${member.MId}</td>
									<td id="mName-${member.MId}">${member.MName}</td>
									<td>
										<div>
										<select id="mRole-${member.MId}" class="form-select"
											aria-label="Default select example">
											<option value="ROLE_USER" ${member.MRole == 'USER' ? 'selected' : ''}>USER</option>
											<option value="ROLE_DBA" ${member.MRole == 'DBA' ? 'selected' : ''}>DBA</option>
										</select>
										</div>
									</td>
									<td>
										<div>
											<select id="teamName-${member.MId}" class="form-select"
												aria-label="Default select example">
												<option value="개발1팀" ${member.teamName == '개발1팀' ? 'selected' : ''}>개발1팀</option>
												<option value="개발2팀" ${member.teamName == '개발2팀' ? 'selected' : ''}>개발2팀</option>
												<option value="개발3팀" ${member.teamName == '개발3팀' ? 'selected' : ''}>개발3팀</option>
											</select>
											</div>
										</td>
									<td id="edit"><input type="text" class="form-control" id="mEmpId-${member.MId}" value="${member.MEmpId}"></td>
									<td id="edit"><input type="text" class="form-control" id="mTel-${member.MId}" value="${member.MTel}"> </td>
									<td><fmt:formatDate  value="${member.MRegdate}" pattern="yyyy-MM-dd"/></td>
									<td>
										<div>
											<select id="mIsactive-${member.MId}" class="form-select"
												aria-label="Default select example">
												<option value="1" ${member.MIsActive == 1 ? 'selected' : ''}>Y</option>
												<option value="0" ${member.MIsActive == 0 ? 'selected' : ''}>N</option>
											</select>
										</div>
									</td>
									<td><button class="btn btn-sm me-2 btn-approve"  id="btn-approve"  data-m-id="${member.MId}" type="button">수정</button></td>
							</form>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					
					<div class="page">
	           			<a href="accountList?pageNo=1" class="btn btn-outline-secondary btn-sm"><<</a>
	           			<c:if test="${pager.groupNo>1}">
	           				<a href="accountList?pageNo=${pager.startPageNo-1}" class="btn btn-outline-dark btn-sm"><</a>
	           			</c:if>
	           			
	           			<c:forEach begin="${pager.startPageNo}" end="${pager.endPageNo}" step="1" var="i">
	           				<c:if test="${pager.pageNo==i}">
	           					<a href="accountList?pageNo=${i}" class="btn btn-secondary btn-sm">${i}</a>
	           				</c:if>
	           				<c:if test="${pager.pageNo!=i}">
	           					<a href="accountList?pageNo=${i}" class="btn btn-outline-secondary btn-sm">${i}</a>
	           				</c:if>
	           			</c:forEach>
	           			
	           			<c:if test="${pager.groupNo<pager.totalGroupNo}">
	           				<a href="accountList?pageNo=${pager.endPageNo+1}" class="btn btn-outline-dark btn-sm">></a>
	           			</c:if>
	           			<a href="accountList?pageNo=${pager.totalPageNo}" class="btn btn-outline-secondary btn-sm">>></a>
	           			
	           		</div>	
				</div>
			</div>
		</div>
	</div>
	</div>

<div class="modal fade" tabindex="-1" id="teamModal" data-bs-backdrop="static">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title">회원 소속 관리</h4>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<div class="container team-container">
	      		<div class="row d-flex gap-3">
	      			<div class="col team-container">
                             <div class="team-subtitle">소속 내역</div>
	      				<table class="table" id="teamTable">
	      					<thead class="table-secondary">
                                <tr>
                                   <th scope="col">No.</th>
                                    <th scope="col">회원 소속명</th>
                                    <th scope="col">사용여부</th>
                                </tr>
                            </thead>
                            <tbody id="teamList"></tbody>
	      				</table>
	      			</div>
	      			<div class="col team-form">
                             <div class="team-subtitle">소속 추가/수정</div>
	      				<table class="table" id="teamForm">
                                <tr>
                                    <td class="table-secondary">소속명</td>
                                    <td><input type="text" id="teamName"  placeholder="내용 입력" required></td>   
                                </tr>
                                <tr>
                                    <td class="table-secondary">사용여부</td>
                                    <td>
                                    	<select id="teamIsActive" class="form-select use-status-select" aria-label="사용 여부 선택">
                                            <option value="1">Y</option>
                                            <option value="0">N</option>
                                        </select>
                                    </td>   
                                </tr>
	      				</table>
	      				<div class="button-group">
		                    <button class="team-add" type="button">추가</button>
		                    <button class="team-edit" type="button" disabled>수정</button>
		                </div>
	      			</div>
	      		</div>
	      	</div>
	      </div>
	      <div class="modal-footer">
		      <div class="modal-btns">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		        <button type="button" class="btn btn-primary">저장하기</button>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>

<script src="${pageContext.request.contextPath}/resources/js/account/accountList.js"></script>
</body>
</html>