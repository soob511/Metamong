<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>
<link	href="${pageContext.request.contextPath}/resources/css/home/home.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.5/dist/chart.umd.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row">
		<jsp:include page="/WEB-INF/views/common/menuAdmin.jsp" /> 
		<div class="col">
			<jsp:include page="/WEB-INF/views/common/header.jsp" /> 
			<div class="container main-container">
				<div class="row">
					<div class="col-6">
						<p class="board-title">신청 현황</p>
						<div class="container dash-board">
							<div class="row">
								<div class="col-4 chart">
									<canvas id="chart" width="400" height="400"></canvas>
								</div>
								<div class="col">							
									<p class="project-title"># MetaMong 프로젝트</p>
									<h4 class="project-user">반가워요! <span class="fw-bold">${userName}</span><span class="fs-5">님</span></h4>
									<div class="summary-box d-flex justify-content-center align-items-center">
										<div>
											<p>접수</p>
											<h3><span class="fw-bold">2</span><span class="fs-4">건</span></h3>
										</div>
										<div>
											<p>승인</p>
											<h3><span class="fw-bold">13</span><span class="fs-4">건</span></h3>
										</div>
										<div>
											<p>반려</p>
											<h3><span class="fw-bold">3</span><span class="fs-4">건</span></h3>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col notice-box">
						<div class="d-flex justify-content-between">
							<p class="board-title">공지사항</p>
							<a href="${pageContext.request.contextPath}/notice/noticeList"><button class="btn-notice">+ 더보기</button></a>
						</div>
						<table class="table table-hover">
                    <thead class="table">
                        <tr class="table-secondary">
                            <th scope="col">No.</th>
                            <th scope="col">제목</th>
                            <th scope="col">등록일</th>
                            <th scope="col">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${noticeList}" var="notice" varStatus="status">           
		                        <tr class="table-row">
		                            <td scope="row">
			                            <c:choose>
											<c:when test="${notice.noticeIsimp == '1'}">
												<img
													src="${pageContext.request.contextPath}/resources/image/icon_notice.png"
													alt="중요도" style="width: 20px; height: 20px ">
											</c:when>
											<c:otherwise>
												${pager.totalRows - (pager.pageNo-1) * 10 - status.index}
											</c:otherwise>
									</c:choose>
									</td>                          
		                            <td><a href="${pageContext.request.contextPath}/notice/noticeDetail?noticeId=${notice.noticeId}" style="color:black;">${notice.noticeTitle}</a></td>
		                            <td><fmt:formatDate value="${notice.noticeRegdate}" pattern="yyyy-MM-dd"/></td>
		                            <td>${notice.noticeHitcount}</td>
		                        </tr>
	                      </c:forEach>    
                    </tbody>
                </table>
					</div>
				</div>
				<div class="row">
					<div class="col-5">
						<p class="board-title">가입현황</p>
						<canvas id="line-chart" width="525" height="315"></canvas>
					</div>
						<div class="col ms-4">
							<p class="board-title">계정 목록</p>
							<div class="col-box">
								<table class="table table-hover">
									<thead class="table">
										<tr class="table-secondary">
											<th scope="col">No.</th>
											<th scope="col">ID</th>
											<th scope="col">이름</th>
											<th scope="col">권한</th>
											<th scope="col">소속</th>
											<th scope="col">사번</th>
											<th scope="col">가입일</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${memberList}" var="list" varStatus="status">
											<tr>
												<th scope="row">${status.index + 1}</th>
												<td>${list.MId}</td>
												<td>${list.MName}</td>
												<td>${list.MRole}</td>
												<td>${list.teamName}</td>
												<td>${list.MEmpId}</td>
												<td><fmt:formatDate value="${list.MRegdate}"
														pattern="yyyy-MM-dd" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
</div> 
<script src="${pageContext.request.contextPath}/resources/js/home/homeAdmin.js"></script>
</body>
</html>