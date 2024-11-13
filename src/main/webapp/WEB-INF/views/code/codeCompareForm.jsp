<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드 전후비교</title>
<link
	href="${pageContext.request.contextPath}/resources/css/code/codeCompareForm.css"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="row">
			<jsp:include page="/WEB-INF/views/common/menu.jsp" />
			<div class="col">
				<jsp:include page="/WEB-INF/views/common/header.jsp" />
				<div class="container table-management">
				<div>
				<a href="codeUpdateForm?codeNo=${oldCode.codeNo}&isUpdated=1">
					<button class="btn-back btn-accent">뒤로가기</button>
				</a>
					
				</div>
					<div class="row">
						<div class="col-6 before-table">
								<div class="before-management">
									<p class="before-management-title">[기존] ${oldCode.codeId}(${oldCode.codeNm})</p>
								</div>
								<div class="table-container">
									<table class="table">
										<thead class="table-light">
											<tr>
												<th scope="col">No.</th>
												<th scope="col">항목코드</th>
												<th scope="col">항목명</th>
												<th scope="col">사용여부</th>
												<th scope="col">내용</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${oldItems}" var="item" varStatus="i">
											<tr>
												<td>${i.index + 1}</td>
												<td>${item.itemId}</td>
												<td>${item.itemNm}</td>
												<td>${item.itemIsActive == 1 ? 'Y' : 'N' }</td>
												<td>${item.itemContent}</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
						</div>
						<div class="col-6 after-table">
								<div class="after-management">
									<p class="after-management-title">[변경]${newCode.codeId}(${newCode.codeNm})</p>
								</div>
								<div class="table-container">
									<table class="table">
										<thead class="table-light">
											<tr>
												<th scope="col">No.</th>
												<th scope="col">항목코드</th>
												<th scope="col">항목명</th>
												<th scope="col">사용여부</th>
												<th scope="col">내용</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${newItems}" var="item" varStatus="i">
											<tr class="${item.itemIsUpdate == 1 ? 'updated' : null}">
												<td>${i.index + 1}</td>
												<td>${item.itemId}</td>
												<td>${item.itemNm}</td>
												<td>${item.itemIsActive == 1 ? 'Y' : 'N' }</td>
												<td>${item.itemContent}</td>
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
	<script src="${pageContext.request.contextPath}/resources/js/code/codeCompareForm.js" ></script>
</body>
</html>