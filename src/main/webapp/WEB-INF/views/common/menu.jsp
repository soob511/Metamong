<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>

<script src="${pageContext.request.contextPath}/resources/jquery/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link	href="${pageContext.request.contextPath}/resources/css/common/style.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/common/menu.js"></script>

<div class="menu">
	<p class="logo"><a href="${pageContext.request.contextPath}/home">@meta-mong</a></p>
	<ul>
		<li class="menu-item"><a class="item" href="${pageContext.request.contextPath}/home"><i class="bi bi-house-door"></i>HOME</a></li>
		<li class="menu-item">
		    <a href="${pageContext.request.contextPath}/code/codeList" class="toggle-menu item">
		        <i class="bi bi-bar-chart-steps"></i>코드/항목 <i class="bi bi-chevron-down"></i>
		    </a>
		    <ul class="sub-menu">
		        <li class="sub-item"><a href="${pageContext.request.contextPath}/code/codeList">코드/항목 내역</a></li> 
		        <li class="sub-item"><a href="${pageContext.request.contextPath}/code/codeApplyList">신청내역</a></li>
		    </ul>
		</li>	
		<li class="menu-item">
		    <a href="${pageContext.request.contextPath}/table/tableList" class="toggle-menu item">
		        <i class="bi bi-database"></i>DB Object <i class="bi bi-chevron-down"></i>
		    </a>
		    <ul class="sub-menu">
				<li class="sub-item"><a href="${pageContext.request.contextPath}/table/tableList">Table</a></li>
				<li class="sub-item"><a href="${pageContext.request.contextPath}/sequence/sequenceList">Sequence</a></li>
				<li class="sub-item"><a href="${pageContext.request.contextPath}/index/indexList">Index</a></li>
				<li class="sub-item"><a href="${pageContext.request.contextPath}/table/tableApplyList">신청내역</a></li>
		    </ul>
		</li>	
		<li class="menu-item"><a class="item" href="${pageContext.request.contextPath}/notice/noticeList"><i class="bi bi-check2-square"></i>공지사항</a></li>
		<li class="menu-item"><a class="item" href="${pageContext.request.contextPath}/"><i class="bi bi-clipboard"></i>문의게시판</a></li>
		<li class="menu-item"><a class="item" href="${pageContext.request.contextPath}/member/memberList"><i class="bi bi-people"></i>직원목록</a></li>
		<li class="menu-item logout"><a href="${pageContext.request.contextPath}/member/loginForm"><i class="bi bi-box-arrow-right"></i>Log out</a></li>
	</ul>
</div>