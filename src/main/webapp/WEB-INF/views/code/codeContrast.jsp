<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>codeContrast</title>
<link href="${pageContext.request.contextPath}/resources/css/code/codeContrast.css" rel="stylesheet">
</head>
<body>
<div class="container">
	<div class="row">
		<jsp:include page="/WEB-INF/views/common/menu.jsp" /> 
		<div class="col">
			<jsp:include page="/WEB-INF/views/common/header.jsp" /> 
			<div class="container">
				<div class="row">
					<div class="col-6">
					<div class="code-contrast-header">> PPRTINFO 코드 수정전</div>
						<div></div>
						<table class="code-contrast-table">
							<tr class="custom-table">
								<th>No.</th>
								<th>항목코드</th>
								<th>항목명</th>
								<th>사용여부</th>
								<th>내용</th>
							</tr>
							<tr class="custom-table">
								<td>1</td>
								<td>재산</td>
								<td>PPRT</td>
								<td>Y</td>
								<td>좋아요</td>
							</tr>
						</table>						
					</div>				
				
					<div class="col-6">
						<div class="code-contrast-header">> PPRTINFO 코드 수정후</div>
						<table class="table code-contrast-table">
							<tr class="table-primary">
								<th>No.</th>
								<th>항목코드</th>
								<th>항목명</th>
								<th>사용여부</th>
								<th>내용</th>
							</tr>
							<tr>
								<td>1</td>
								<td>재산</td>
								<td>PPRT</td>
								<td>Y</td>
								<td>좋아요</td>
							</tr>
							<tr>
								<td>1</td>
								<td>재산</td>
								<td>PPRT</td>
								<td>Y</td>
								<td>좋아요</td>
							</tr>
							<tr>
								<td>1</td>
								<td>재산</td>
								<td>PPRT</td>
								<td>Y</td>
								<td>좋아요</td>
							</tr>
						</table>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</div> 
<script src="${pageContext.request.contextPath}/resources/js/index.js"></script>
</body>
</html>