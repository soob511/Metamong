<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>
<link	href="${pageContext.request.contextPath}/resources/css/home.css" rel="stylesheet">
</head>
<body>
<div class="container">
	<div class="row">
		<jsp:include page="/WEB-INF/views/common/menu.jsp" /> 
		<div class="col">
			<jsp:include page="/WEB-INF/views/common/header.jsp" /> 
			<div class="container main-container">
				<div class="row">
					<div class="col">
						<h5>신청 현황</h5>
						<div class="container dash-board">
							<div class="row">
								<div class="col-4 chart">차트</div>
								<div class="col-8">							
									<p># MetaMong 프로젝트</p>
									<h4>반가워요! <span>김유저</span>님</h4>
									<div class="summary">전체</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col">공지사항</div>
				</div>
				<div class="row">
					<div class="col-4">테이블 목록</div>
					<div class="col-8">속성(Column) 목록</div>
				</div>
			</div>
		</div>
	</div>
</div> 
<script src="${pageContext.request.contextPath}/resources/js/home.js"></script>
</body>
</html>