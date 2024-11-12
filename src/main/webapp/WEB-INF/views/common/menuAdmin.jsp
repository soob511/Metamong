<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" %>

<script src="${pageContext.request.contextPath}/resources/jquery/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link	href="${pageContext.request.contextPath}/resources/css/common/style.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/common/menu.js"></script>

<div class="menu">
	<p class="logo"><a href="${pageContext.request.contextPath}/homeAdmin">@meta-mong</a></p>
	<ul>
		<li class="menu-item"><a class="item" href="${pageContext.request.contextPath}/homeAdmin"><i class="bi bi-house-door  pe-2"></i>HOME</a></li>
		<li class="menu-item">
		    <a href="#" class="toggle-menu item d-flex justify-content-between">
		        <span><i class="bi bi-bar-chart-steps pe-2"></i>계정관리</span>
		        <i class="bi bi-chevron-down"></i>
		    </a>
		    <ul class="sub-menu">
		        <li class="sub-item mt-2 "><a href="${pageContext.request.contextPath}/account/accountList">계정내역</a></li> 
		        <li class="sub-item last-item"><a href="${pageContext.request.contextPath}/account/accountApplyList">신청내역</a></li>
		    </ul>
		</li>	
		<li class="menu-item"><a class="item" href="${pageContext.request.contextPath}/notice/noticeList"><i class="bi bi-check2-square pe-2"></i>공지사항</a></li>
		<li class="menu-item logout"><a href="${pageContext.request.contextPath}/logout"><i class="bi bi-box-arrow-right pe-2"></i>Log out</a></li>
	</ul>
</div>